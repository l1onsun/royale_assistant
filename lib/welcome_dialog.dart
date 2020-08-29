import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
//import 'main_router.dart';
import 'themes.dart';

class RichWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new RichText(
      text: new TextSpan(
        text: 'Hello ',
        style: DefaultTextStyle.of(context).style,
        children: <TextSpan>[
          new TextSpan(
              text: 'bold', style: new TextStyle(fontWeight: FontWeight.bold)),
          new TextSpan(text: ' world!'),
        ],
      ),
    );
  }
}

class WelcomeDialog extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  Function callback;

  WelcomeDialog(this.callback);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      //contentTextStyle: DialogTextStyle(),
      content: Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(8.0),
              child: RichText(
                text: TextSpan(
                  style: Theme.of(context).textTheme.headline6,
                  children: <TextSpan>[
                    TextSpan(
                        text: 'Welcome to the\n',
                        style: TextStyle(fontSize: 20)),
                    TextSpan(
                        text: 'Clash Royale Assisstant\n\n',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 22)),
                    TextSpan(
                        text:
                            'You can enter your player #Tag and we will prepare information for you',
                        style: TextStyle(fontSize: 16)),
                  ],
                ),
                textAlign: TextAlign.center,
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: TextFormField(
                  decoration: InputDecoration(labelText: '#Tag XXXXXXX'),
                  validator: (String value) {
                    if (value.isEmpty) {
                      return 'Nickname must not be empty.';
                    }
                    return null;
                  },
                  onSaved: (var newValue) async {
                    var prefs = await SharedPreferences.getInstance();
                    await prefs.setString("nickname", newValue);
                    Navigator.pop(context);
                    callback();
                  }),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: RaisedButton(
                child: Text("Submit"),
                onPressed: () {
                  if (_formKey.currentState.validate()) {
                    _formKey.currentState.save();
                  }
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
