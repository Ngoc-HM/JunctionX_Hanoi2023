import 'package:fintechdemo/src/blocs/database_process.dart';

class Validations {
  static bool isValidUser(String user) {
    return user != null && user.length >= 6;
  }

  static bool isValidPassword(String password) {
    return password != null && password.length >= 6;
  }

  static bool isValidReceiver(String receiver) {
    DatabaseProcess db = DatabaseProcess();
    bool res = false;
    db.checkReceiverName(receiver).then((value) => res = value);
    return res;
  }
}
