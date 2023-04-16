import 'package:flutter/material.dart';

import '../login_page.dart';
import '../registration_status.dart';

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
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => LoginPage()));
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
                  child: Text("Đã hoàn thành đăng kí, quay lại đăng nhập"),
                  onPressed: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                CreateNewAccountSuccessfully()));
                  },
                )
              ],
            ));
  }
}
