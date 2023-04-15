import 'package:fintechdemo/src/blocs/database_process.dart';
import 'package:fintechdemo/src/blocs/inside_transfer_bloc.dart';
import 'package:fintechdemo/src/blocs/user_information.dart';
import 'package:fintechdemo/src/dont_destroy_on_load.dart';
import 'package:flutter/material.dart';
import 'transferPage/transfer_page.dart';

class Transfer extends StatefulWidget {
  Transfer({super.key});
  @override
  _Transfer createState() => _Transfer();
}

class _Transfer extends State<Transfer> {
  List<Widget> _feature = [
    Inside(), ToBank(), ToCard()
  ];
  List<Widget> _featureName = [
    Padding(
      padding: EdgeInsets.symmetric(horizontal: 12),
      child: Text('Nội bộ bank', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold), textAlign: TextAlign.center),
    ),
    Padding(
      padding: EdgeInsets.symmetric(horizontal: 12),
      child: Text('Chuyển tiền vào STK', style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold), textAlign: TextAlign.center),
    ),
    Padding(
      padding: EdgeInsets.symmetric(horizontal: 12),
      child: Text('Chuyển tiền vào số thẻ', style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold), textAlign: TextAlign.center),
    ),
  ];
  List<bool> _isFeatureSelected = [true, false, false];
  int _stateIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      crossAxisAlignment: WrapCrossAlignment.center,
      children: [
        SizedBox(width: double.infinity, height: 10,),
        Center(child: ToggleButtons(
            constraints: BoxConstraints(maxWidth: 120, minHeight: 50, maxHeight: 50),
            fillColor: Colors.lightGreen[700]!,
            selectedColor: Colors.white,
            selectedBorderColor: Colors.lightGreen[300]!,
            onPressed: (int index) {
              setState(() {
                _stateIndex = index;
                for (int i=0; i < _featureName.length; i++) _isFeatureSelected[i] = i == index;
              });
            },
            children: _featureName,
            isSelected: _isFeatureSelected)
        ),
        SizedBox(width: double.infinity, height: 5,),
        _feature[_stateIndex]
      ],
    );
  }
}

Route _createRoute() {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => TransferPage(senderID: remainUser.keys.first, receiverID: TransferDontDestroyOnLoad.receiverID, money: 0),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(0.0, 1.0);
      const end = Offset.zero;
      const curve = Curves.ease;

      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

      return SlideTransition(
        position: animation.drive(tween),
        child: child,
      );
    },
  );
}

class Inside extends StatefulWidget {
  Inside({super.key});
  @override
  _Inside createState() => _Inside();
}

class InsideDoNotDestroyOnLoad {
  static String? inputReceiver = "";
}

class _Inside extends State<Inside> {
  String? _receiverName = "";
  InsideReceiverBloc bloc = InsideReceiverBloc();
  TextEditingController _receiverController = new TextEditingController();
  var _receiverError = "Tài khoản không hợp lệ";
  bool _receiverInvalid = true;
  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        Padding(
            padding: const EdgeInsets.fromLTRB(20, 0, 20, 10),
            child: StreamBuilder(
              stream: bloc.receiverStream,
              builder: (context, snapshot) => TextField(
                restorationId: InsideDoNotDestroyOnLoad.inputReceiver,
                controller: _receiverController,
                onChanged: (text) {setState(() {
                  _receiverInvalid = true;
                });},
                onSubmitted: (text) {
                  setState(() {
                    String? receiver = bloc.isValidInfo(_receiverController.text);
                    _receiverInvalid = (receiver == "" || receiver == Null);
                    _receiverName = receiver;
                    InsideDoNotDestroyOnLoad.inputReceiver = _receiverController.text;
                    if(_receiverInvalid) {
                      if (_receiverController.text != "") showDialog(context: context,
                          builder: (BuildContext
                               context) => AlertDialog(
                          title: Text("Lỗi"),
                          content: const Text('Không có tài khoản đã nhập'),
                          actions: <Widget>[
                            TextButton(
                              onPressed: () => Navigator.pop(context, 'Thoát'),
                              child: const Text('Thoát'),
                            ),
                          ],
                        ));
                  _receiverInvalid = true;}

                  });
                },
                style: TextStyle(fontSize: 18, color: Colors.black),
                decoration: InputDecoration(
                  labelText: "Tên tài khoản",
                  errorText:
                  snapshot.hasError ? snapshot.error.toString() : null,
                  labelStyle:
                  TextStyle(color: Color(0xff888888), fontSize: 15),
                ),
              ),
            )),
        Padding(
          padding: EdgeInsets.fromLTRB(20, 0, 20, 10),
          child: Text("${(_receiverInvalid) ? "" :_receiverName}", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),),),
        Center(
            child: ElevatedButton(
            onPressed: !_receiverInvalid?( () {
              TransferDontDestroyOnLoad.receiverID = _receiverController.text;
              Navigator.push(context,_createRoute());
            }): null,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 12),
              child: Text('Chuyển khoản', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold), textAlign: TextAlign.center),
              )
            )
        )
      ],
    );
  }
}

class ToBank extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(child: Text("Tính năng đang phát triển"));
  }
}

class ToCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(child: Text("Tính năng đang phát triển"));
  }
}