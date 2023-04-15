import 'package:flutter/material.dart';

import '../../bank_activities.dart';

late List<SendInMoney> history = [];

class History extends StatefulWidget {
  History({super.key});
  @override
  _History createState() => _History();
}

class _History extends State<History> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          for (var i = 0; i < history.length; i++)
            history[i].Infomation(),
        ],
      ),
    );
  }
}