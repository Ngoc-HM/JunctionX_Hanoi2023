import 'dart:async';
import 'package:fintechdemo/src/blocs/database_process.dart';
import 'package:fintechdemo/src/blocs/user_information.dart';

import '../validators/validations.dart';

class LoginBloc {
  DatabaseProcess db = DatabaseProcess();
  bool isRightAccount = false;
  bool needRequest = false;

  StreamController _userController = new StreamController();
  StreamController _passController = new StreamController();

  Stream get userStream => _userController.stream;
  Stream get passStream => _passController.stream;

  void checkUser(String username, String password) async {

  }

  Future<bool> isValidInfo(String username, String password) async {
    if (!Validations.isValidUser(username)) {
      _userController.sink.addError("Tài khoản không hợp lệ");
      return Future(() => false);
    }
    _userController.sink.add("OK");

    if (!Validations.isValidPassword(password)) {
      _passController.sink.addError("Mật khẩu phải trên 6 kí tự");
      return Future(() => false);
    }

    if (!Validations.isValidUser(username) && !Validations.isValidPassword(password)) {
      _userController.sink.addError("Tài khoản không hợp lệ");
      _passController.sink.addError("Mật khẩu phải trên 6 kí tự");
      return Future(() => false);
    }

    isRightAccount = await db.checkUser(username, password);

    //set interval to check if isRightAccount is true
    int count = 0;
    while (!isRightAccount) {
      if (count > 100) {
        _passController.sink.addError("Tài khoản hoặc mật khẩu không đúng");
        return Future(() => false);
     }
      count++;
      Future.delayed(Duration(milliseconds: 100));
    }

    if (isRightAccount) {
      needRequest = true;
    }

    _userController.sink.add("OK");
    _passController.sink.add("OK");
    return Future(() => needRequest);
  }

  void dispose() {
    _userController.close();
    _passController.close();
  }
}
