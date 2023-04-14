// ignore_for_file: non_constant_identifier_names

import 'dart:async';
import 'package:fintechdemo/src/blocs/fire_base/fire_base_auth.dart';

class AuthBloc {
  var _firebaseAuth = FireAuth();

  StreamController _sotienController = new StreamController();
  StreamController _tinnhanController = new StreamController();


  Stream get sotienStream => _sotienController.stream;
  Stream get tinnhanStream => _tinnhanController.stream;


  bool isValidAcc(String sotien, String tinnhan) {
    if (sotien == null || sotien.length == 0) {
      _sotienController.sink.addError("số tiền không được để trống");
      return false;
    }
    _sotienController.sink.add("");
    _tinnhanController.sink.add("");
    return true;
  }

  void dispose() {
    _sotienController.close();
    _tinnhanController.close();
  }
}
