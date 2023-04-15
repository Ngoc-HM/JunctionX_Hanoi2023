import 'dart:async';
import '../validators/validations.dart';
import 'database_process.dart';

class InsideReceiverBloc {
  StreamController _receiverController = new StreamController();
  DatabaseProcess db = DatabaseProcess();

  Stream get receiverStream => _receiverController.stream;

  String isValidInfo(String receiver) {
    bool res = false;
    String res2 = "";
    if (!Validations.isValidReceiver(receiver)) return "";
    _receiverController.sink.add("OK");
    db.checkReceiverName(receiver).then((value) => res = value);
    db.getChildNameByAttribute('name', receiver).then((value) => res2 = value);
    return res2;
  }

  void dispose() {
    _receiverController.close();
  }
}
