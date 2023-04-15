import 'package:flutter/material.dart';

import '../login_page.dart';

class MsgDialog {
  static void showMsgDialog(BuildContext context, String title, String msg) {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: Text(msg),
              content: Text(msg),
              actions: <Widget>[
                TextButton(
                  child: Text("OK"),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                )
              ],
            ));
  }
}

class MsgDialogtrue {
  static void showMsgDialog(BuildContext context, String title, String msg) {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: Text(msg),
              content: Text(msg),
              actions: <Widget>[
                TextButton(
                  child: Text("Quay trở lại để đăng nhập"),
                  onPressed: () {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => LoginPage()));
                  },
                )
              ],
            ));
  }
}
