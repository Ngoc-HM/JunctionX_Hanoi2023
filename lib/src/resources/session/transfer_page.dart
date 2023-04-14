import 'package:fintechdemo/src/blocs/transfer_bloc.dart';
import 'package:fintechdemo/src/blocs/user_information.dart';
import 'package:fintechdemo/src/dont_destroy_on_load.dart';
import 'package:fintechdemo/src/validators/validations.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';
import 'package:intl/intl.dart';

class TransferPage extends StatelessWidget {
  String senderID = "";
  String receiverID = "";
  int money = 0;

  TransferPage({Key? key, required this.senderID, required this.receiverID, required this.money}): super(key:key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightGreen[700]!,
        title: Text("Chuyển tiền", style: TextStyle(
          color: Colors.black,
        )),
        centerTitle: true,
        leading: IconButton(
          color: Colors.black,
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: TransferInfoScreen(senderID: senderID, receiverID: receiverID,money: money),
      );
  }
}

class TransferInfoScreen extends StatefulWidget {
  String senderID = "";
  String receiverID = "";
  int money = 0;

  TransferInfoScreen({Key? key, required this.senderID, required this.receiverID, required this.money}): super(key:key);
  @override
  _TransferInfoScreen createState() => _TransferInfoScreen(senderID: senderID, receiverID: receiverID, money: money);
}

class _TransferInfoScreen extends State<TransferInfoScreen> {
  String senderID = "";
  String receiverID = "";
  int money = 0;

  TransferBloc bloc = TransferBloc();
  var _moneyController = new TextEditingController();
  TextEditingController _contentController = new TextEditingController();
  String content = "";
  bool _isEditing = false;

  _TransferInfoScreen({Key? key, required this.senderID, required this.receiverID, required this.money});
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(height: 10,),
        //Sender
        Padding(
            padding: EdgeInsets.only(right: 50),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.lightGreen,
                borderRadius: BorderRadius.only(bottomRight: Radius.circular(35)),
              ),
              constraints: BoxConstraints(minHeight: 70, maxHeight: 70),
              child: Row(
                children: [
                  Expanded(
                      flex: 2,
                      child: Expanded(
                          flex: 2,
                          child: CircleAvatar(backgroundColor: Colors.white,child: FlutterLogo(),),
                      ),
                  ),
                  Expanded(
                    flex: 10,
                    child: Text("${testUser.name}\n${NumberFormat("\$#,##0").format(testUser.money)}"),
                  )
                ],
              )
            ),
        ),
        SizedBox(height: 10,),
        //Receiver
        Padding(
          padding: EdgeInsets.only(left: 50),
          child: Container(
              decoration: BoxDecoration(
                color: Colors.lightGreen,
                borderRadius: BorderRadius.only(bottomLeft: Radius.circular(35)),
              ),
              constraints: BoxConstraints(minHeight: 70, maxHeight: 70),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    flex: 10,
                    child: Text("${Validations.validReceiver[receiverID]}\n${receiverID}", textAlign: TextAlign.end,),
                  ),
                  Expanded(
                    flex: 2,
                    child: CircleAvatar(backgroundColor: Colors.white,child: FlutterLogo(),),
                    ),
                ],
              )
          ),
        ),
        SizedBox(height: 10,),
        Padding(
            padding: const EdgeInsets.fromLTRB(20, 0, 20, 10),
            child: StreamBuilder(
              stream: bloc.moneyStream,
              builder: (context, snapshot) => TextField(
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                keyboardType: TextInputType.number,
                restorationId: money.toString(),
                controller: _moneyController,
                onSubmitted: (curr) {
                  setState(() {
                    money = int.parse(_moneyController.text);
                  });
                },
                style: TextStyle(fontSize: 18, color: Colors.black),
                decoration: InputDecoration(
                  labelText: "Số tiền",
                  errorText:
                  snapshot.hasError ? snapshot.error.toString() : null,
                  labelStyle:
                  TextStyle(color: Color(0xff888888), fontSize: 15),
                ),
              ),
            )),
        SizedBox(height: 10,),
        Padding(
            padding: const EdgeInsets.fromLTRB(20, 0, 20, 10),
            child: StreamBuilder(
              stream: bloc.contentStream,
              builder: (context, snapshot) => TextField(
                maxLength: 100,
                keyboardType: TextInputType.text,
                controller: _contentController,
                onSubmitted: (curr) {
                  setState(() {
                    content = _contentController.text;
                  });
                },
                style: TextStyle(fontSize: 18, color: Colors.black),
                decoration: InputDecoration(
                  labelText: "Nội dung",
                  errorText:
                  snapshot.hasError ? snapshot.error.toString() : null,
                  labelStyle:
                  TextStyle(color: Color(0xff888888), fontSize: 15),
                ),
              ),
            )),
        Center(
            child: ElevatedButton(
                onPressed: (money > 0 && !_isEditing)?( () {
                  //Navigator.push(context,_createRoute());
                  print("Hello 1/4");
                }): null,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 12),
                  child: Text('Chuyển tiền', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold), textAlign: TextAlign.center),
                )
            )
        )
      ],
    );
  }
}