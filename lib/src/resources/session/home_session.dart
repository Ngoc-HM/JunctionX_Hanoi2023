import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:fintechdemo/src/blocs/user_information.dart';
import 'dart:math';
import 'dart:async';
import 'package:flutter/services.dart';
import 'package:local_auth/local_auth.dart';
import 'package:local_auth/error_codes.dart' as auth_error;

enum _SupportState {
  unknown,
  supported,
  unsupported,
}

class HomeDoNotDestroyOnLoad {
  static bool canSee = false;
  static bool hasAuthenticate = false;
}

class Credit extends StatefulWidget {
  Credit({super.key});
  @override
  _Credit createState() => _Credit();
}

class _Credit extends State<Credit> {
  //Authentication stuff
  final LocalAuthentication auth = LocalAuthentication();
  _SupportState _supportState = _SupportState.unknown;
  bool didAuthenticate = false;
  // Data
  User _user = testUser;
  bool _canSee = HomeDoNotDestroyOnLoad.canSee;

  @override
  void initState() {
    super.initState();
    auth.isDeviceSupported().then(
          (bool isSupported) => setState(() => _supportState = isSupported
          ? _SupportState.supported
          : _SupportState.unsupported),
    );
  }

  void _userWantToSee() async {
    try {
      if (_canSee || HomeDoNotDestroyOnLoad.hasAuthenticate) return;
      didAuthenticate = await auth.authenticate(
          localizedReason: 'Xác nhận vân tay để hiện số dư tài khoản.',
          biometricOnly: true);
    }
    on PlatformException catch (e) {
      if (e.code == auth_error.notAvailable || e.code == auth_error.notEnrolled) {
        print("Ủa alo");
        didAuthenticate = false;
      }
      else print(e.message);
    }
    finally {
      setState(() {
        if (_canSee) {
          _canSee = false;
          HomeDoNotDestroyOnLoad.canSee = false;
        }
        else if (didAuthenticate || HomeDoNotDestroyOnLoad.hasAuthenticate) {
          //more security stuff
          _canSee = true;
          HomeDoNotDestroyOnLoad.canSee = true;
          HomeDoNotDestroyOnLoad.hasAuthenticate = true;
        }
      });
    }
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
    return Wrap(
      children: <Widget>[Container(
      constraints: BoxConstraints(minHeight: 200, maxHeight: 200),
      height: 200,
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.fromLTRB(10, 10, 10, 10),
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
              _user.name,
              style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 35),
            ),
          ),
        Expanded(
          flex: 2,
          child: Text(
            "SĐT/Email đăng kí: ${_user.accountName}",
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 17),
          ),
        ),
          Expanded(
              flex: 4,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    _canSee ? NumberFormat("\$#,##0").format(_user.money) : "*" * max(_user.money.toString().length, 6),
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
      )
    ]);
  }
}