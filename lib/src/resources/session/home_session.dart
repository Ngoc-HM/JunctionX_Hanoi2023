import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'dart:math';

class Credit extends StatefulWidget {
  Credit({super.key});
  @override
  _Credit createState() => _Credit();
}

class _Credit extends State<Credit> {
  String _customName = "VU THI HANG";
  int _money = 10000000;
  bool _canSee = false;

  void _userWantToSee() {
    setState(() {
      if (_canSee) _canSee = false;
      else {
        //more security stuff
        _canSee = true;
      }
    });
  }

  String _period() {
    int hour = DateTime.now().hour;
    if (hour < 5) return "Chào cú đêm!";
    if (hour < 11) return "Chào buổi sáng!";
    if (hour < 14) return "Chào buổi trưa!";
    if (hour < 18) return "Chào buổi chiều!";
    if (hour < 22) return "Chào buổi tối!";
    return "Ngủ đủ giấc nhá!";
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
      padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
      decoration: BoxDecoration(
          color: Colors.lightGreen.shade300,
          borderRadius: BorderRadius.all(Radius.circular(5))
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(
            flex: 2,
            child: Text(
              _period(),
              style: TextStyle(color: Colors.black, fontWeight: FontWeight.w100, fontSize: 20),
            ),)
          ,
          Expanded(
            flex: 4,
            child: Text(
              _customName,
              style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 35),
            ),
          )
          ,
          Expanded(
              flex: 4,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    _canSee ? NumberFormat("\$#,##0").format(_money) : "*" * max(_money.toString().length, 6),
                    style: TextStyle(color: Colors.black, fontWeight: FontWeight.w200, fontSize: 30),
                  ),
                  IconButton(
                    onPressed: _userWantToSee,
                    icon: Icon(_canSee ? Icons.visibility_off: Icons.visibility),
                    color: Colors.black45,
                  )
                ],
              )
          )
          ,
        ],
      ),
    );
  }
}