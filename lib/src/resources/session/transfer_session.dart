import 'package:fintechdemo/src/blocs/inside_transfer_bloc.dart';
import 'package:flutter/material.dart';

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
      child: Text('Chuyển tiền vào STK', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold), textAlign: TextAlign.center),
    ),
    Padding(
      padding: EdgeInsets.symmetric(horizontal: 12),
      child: Text('Chuyển tiền vào số thẻ', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold), textAlign: TextAlign.center),
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
        _feature[_stateIndex]
      ],
    );
  }
}

class Inside extends StatefulWidget {
  Inside({super.key});
  @override
  _Inside createState() => _Inside();
}

class _Inside extends State<Inside> {
  String? _receiverName = "";
  InsideReceiverBloc bloc = InsideReceiverBloc();
  TextEditingController _receiverController = new TextEditingController();
  var _receiverError = "Tài khoản không hợp lệ";
  bool _receiverInvalid = false;
  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        Padding(
            padding: const EdgeInsets.fromLTRB(20, 0, 20, 10),
            child: StreamBuilder(
              stream: bloc.receiverStream,
              builder: (context, snapshot) => TextField(
                controller: _receiverController,
                onEditingComplete: () {
                  setState(() {
                    String? receiver = bloc.isValidInfo(_receiverController.text);
                    if (receiver != "" && receiver != Null) _receiverName = receiver;
                    else showDialog(context: context,
                        builder: (BuildContext context) => AlertDialog(
                          title: Text("Lỗi"),
                          content: const Text('Không có tài khoản đã nhập'),
                          actions: <Widget>[
                            TextButton(
                              onPressed: () => Navigator.pop(context, 'Thoát'),
                              child: const Text('Thoát'),
                            ),
                          ],
                        ));
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
          padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
          child: Text("$_receiverName", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),),)

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