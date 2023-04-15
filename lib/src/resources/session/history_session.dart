import 'package:fintechdemo/src/blocs/database_process.dart';
import 'package:flutter/material.dart';

import '../../bank_activities.dart';
import '../../blocs/user_information.dart';

late List<SendInMoney> history = [];

class History extends StatefulWidget {
  History({super.key});
  @override
  _History createState() => _History();
}

class _History extends State<History> {
  DatabaseProcess db = DatabaseProcess();
  @override
  Widget build(BuildContext context) {
    // db.getTop100Rows('history', 'senderID', USER_ID, 'receiverID', USER_ID,'time').then((value) {
    //   for (var i = 0; i < value.length; i++)
    //     history.add(SendInMoney(
    //         senderID: value[i]['senderID']!,
    //         receiverID: value[i]['receiverID']!,
    //         amount: int.parse(value[i]['amount']!),
    //         content: value[i]['content']!,
    //         time: DateTime.parse(value[i]['time']!))
    // );});
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