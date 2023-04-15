import 'package:fintechdemo/src/blocs/user_information.dart';
import 'package:fintechdemo/src/validators/validations.dart';
import 'package:flutter/material.dart';

class SendInMoney {
  late String senderID;
  late String receiverID;
  late int amount;
  late String? content;
  late DateTime time;

  SendInMoney({Key? key, required this.senderID, required this.receiverID, required this.amount, required this.content, required this.time});

  Widget Infomation() {
    return Column(
      children: [
        Row(children: [Text(time.toString())],),
        Row( children: [ Text("Sender: $senderID"), Text("Receiver: $receiverID") ] ),
        Row( children: [ Text("Amount: ${(USER_ID == senderID)?'-':'+'}$amount"), Text("Content: $content") ] ),
      ],
    );
  }

}
