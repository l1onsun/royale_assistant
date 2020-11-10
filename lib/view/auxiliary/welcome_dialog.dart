import 'package:flutter/material.dart';
import 'package:royale_flutter/data_managment/data_model.dart';
import 'package:royale_flutter/view/auxiliary/select_tag_form.dart';

void handleWelcomeDialog(DataModel data, BuildContext context) {
  print("data.welcome: " + data.welcome.toString());
  if (data.welcome == WelcomeDialogState.ready) {
    data.welcome = WelcomeDialogState.complete;
    showDialog(
      context: context,
      builder: (_) => WelcomeDialog(data),
      barrierDismissible: true,
    );
  }
}

class WelcomeDialog extends StatelessWidget {
  static String dataKey = "welcome";
  DataModel data;
  WelcomeDialog(this.data);

  enterTag(BuildContext context) {
    Navigator.pop(context);
    pushSelectTagForm(context, data);
  }

  @override
  Widget build(BuildContext context) {
    // var myFocusNode = FocusNode();
    // ScrollController s_controller = ScrollController();

    return AlertDialog(
      content: SingleChildScrollView(
        //controller: s_controller,
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
                        text: 'Clash Royale Assisstant',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 22)),
                  ],
                ),
                textAlign: TextAlign.center,
              ),
            ),
            Image(
              image: AssetImage('assets/welcome.jpg'),
              width: 200,
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: TextFormField(
                // focusNode: myFocusNode,
                // onTap: () {
                //   Future.delayed(Duration(seconds: 1), () {
                //     myFocusNode.requestFocus();
                //     print("request focus");
                //   });
                // },
                decoration:
                    InputDecoration(labelText: 'Enter your player #Tag:'),
                onTap: () {
                  enterTag(context);
                },
              ),
            ),
            Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    RaisedButton(
                      color: Colors.grey[100],
                      child: Text("Later"),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                    RaisedButton(
                      color: Colors.grey[100],
                      child: Text("Enter Tag"),
                      onPressed: () {
                        enterTag(context);
                      },
                    ),
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
