import 'dart:async';
import '../validators/validations.dart';

class InsideReceiverBloc {
  StreamController _receiverController = new StreamController();

  Stream get receiverStream => _receiverController.stream;

  String? isValidInfo(String receiver) {
    if (!Validations.isValidReceiver(receiver)) return "";
    _receiverController.sink.add("OK");
    return Validations.validReceiver[receiver];
  }

  void dispose() {
    _receiverController.close();
  }
}
