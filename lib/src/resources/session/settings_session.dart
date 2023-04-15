import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../login_page.dart';

class Settings extends StatefulWidget {
  Settings({super.key});
  @override
  _Settings createState() => _Settings();
}

class _Settings extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: TextButton(
          onPressed: () => Navigator.of(context)
              .pushAndRemoveUntil(
            CupertinoPageRoute(
                builder: (context) => LoginPage()
            ),
                (_) => false,
          ),
          child: Text("Log out"),
        )
    );
  }
}