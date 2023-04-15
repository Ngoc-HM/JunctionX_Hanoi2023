import 'package:fintechdemo/src/blocs/user_information.dart';
import 'package:fintechdemo/src/validators/validations.dart';
import 'package:flutter/material.dart';

class SendInMoney {
  late String senderID;
  late String receiverID;
  late int amount;
  late String? content;

  SendInMoney({Key? key, required this.senderID, required this.receiverID, required this.amount, required this.content});

  Widget Infomation() {
    return Column(
      children: [
        Row( children: [ Text("Sender: $senderID"), Text("Receiver: $receiverID") ] ),
        Row( children: [ Text("Amount: $amount"), Text("Content: $content") ] ),
      ],
    );
  }

  void Sent(int amount) {
    testUser.money -= amount;
  }
}
