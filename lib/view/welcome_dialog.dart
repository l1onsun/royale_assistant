import 'package:flutter/material.dart';

void pushWelcomeDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (_) => WelcomeDialog(),
    barrierDismissible: true,
  );
}

class WelcomeDialog extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  WelcomeDialog();

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
                  Navigator.pop(context);
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
                        Navigator.pop(context);
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

// void input_form() {
//   return Padding(
//     padding: EdgeInsets.all(8.0),
//     child: Form(
//       key: _formKey,
//       child: TextFormField(
//         // focusNode: myFocusNode,
//         // onTap: () {
//         //   Future.delayed(Duration(seconds: 1), () {
//         //     myFocusNode.requestFocus();
//         //     print("request focus");
//         //   });
//         // },
//         decoration: InputDecoration(labelText: 'Enter your player #Tag:'),
//         validator: (String value) {
//           if (value.isEmpty) {
//             return 'Tag must not be empty';
//           }
//           return null;
//         },
//         onSaved: (var newValue) async {
//           var prefs = await SharedPreferences.getInstance();
//           await prefs.setString("nickname", newValue);
//           Navigator.pop(context);
//           callback();
//         },
//         onFieldSubmitted: (value) {
//           if (_formKey.currentState.validate()) {
//             _formKey.currentState.save();
//           }
//         },
//       ),
//     ),
//   );
// }
