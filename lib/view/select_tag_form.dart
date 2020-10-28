import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:royale_flutter/data_managment/data_model.dart';

void pushSelectTagForm(BuildContext context, DataModel dataModel) {
  print("push SelectTagForm");
  Navigator.push(context, MaterialPageRoute(builder: (context) {
    return SelectTagForm(dataModel);
  }));
}

class SelectTagForm extends StatefulWidget {
  final DataModel dataModel;
  SelectTagForm(this.dataModel);

  @override
  _SelectTagFormState createState() => _SelectTagFormState();
}

class _SelectTagFormState extends State<SelectTagForm> {
  final _formKey = GlobalKey<FormState>();
  final textController = TextEditingController();

  submite(BuildContext context, String tag) {
    print("submite");
    widget.dataModel.changeCurrentPlayer(tag);
  }

  @override
  Widget build(BuildContext context) {
    textController.text = "#89R2CQ9J0";
    return Scaffold(
        appBar: AppBar(
          title: Text("Welcome!"),
        ),
        body: Form(
            key: _formKey,
            child: Column(
              children: [
                Text("Enter player tag: "),
                TextFormField(
                  controller: textController,
                  autofocus: true,
                  // The validator receives the text that the user has entered.
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  },
                  // onFieldSubmitted: (value) => submite(context, value),
                ),
                RaisedButton(
                  color: Colors.grey[100],
                  child: Text("Submit"),
                  onPressed: () {
                    if (_formKey.currentState.validate()) {
                      // If the form is valid, display a snackbar. In the real world,
                      // you'd often call a server or save the information in a database.

                      submite(context, textController.text);
                    }
                    //_formKey.currentWidget
                    Navigator.pop(context);
                  },
                ),
              ],
            )));
  }

  @override
  void dispose() {
    textController.dispose();
    super.dispose();
  }
}
