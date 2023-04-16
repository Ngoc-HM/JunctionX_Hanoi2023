import 'package:fintechdemo/src/blocs/user_information.dart';
import 'package:fintechdemo/src/dont_destroy_on_load.dart';
import 'package:fintechdemo/src/resources/session/history_session.dart';
import 'package:fintechdemo/src/validators/validations.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';
import 'package:intl/intl.dart';
import 'package:fintechdemo/src/blocs/transferPage_bloc.dart';
import 'package:local_auth/local_auth.dart';
import '../../../bank_activities.dart';
import '../../../blocs/database_process.dart';

class TransferPage extends StatelessWidget {
  String senderID = "";
  String receiverID = "";
  int money = 0;

  TransferPage(
      {Key? key,
      required this.senderID,
      required this.receiverID,
      required this.money})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightGreen[700]!,
        title: Text("Chuyển tiền",
            style: TextStyle(
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
      body: TransferInfoScreen(
          senderID: senderID,
          receiverID: receiverID,
          money: money), //For future link
    );
  }
}

class TransferInfoScreen extends StatefulWidget {
  final String senderID;
  final String receiverID;
  final int money;

  TransferInfoScreen(
      {Key? key,
      required this.senderID,
      required this.receiverID,
      required this.money})
      : super(key: key);
  @override
  _TransferInfoScreen createState() => _TransferInfoScreen(
      senderID: senderID, receiverID: receiverID, money: money);
}

class _TransferInfoScreen extends State<TransferInfoScreen> {
  DatabaseProcess db = DatabaseProcess();
  AuthBloc bloc = new AuthBloc();
  LocalAuthentication auth = LocalAuthentication();

  TextEditingController _sotienController = new TextEditingController();
  TextEditingController _tinnhanController = new TextEditingController();

  bool _sotienVal = false;
  bool _tinnhanVal = false;

  final String senderID;
  final String receiverID;
  final int money;

  _TransferInfoScreen(
      {Key? key,
      required this.senderID,
      required this.receiverID,
      required this.money});
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 10,
        ),
        //Sender
        Padding(
          padding: EdgeInsets.only(right: 50),
          child: Container(
              decoration: BoxDecoration(
                color: Colors.lightGreen,
                borderRadius:
                    BorderRadius.only(bottomRight: Radius.circular(35)),
              ),
              constraints: BoxConstraints(minHeight: 70, maxHeight: 70),
              child: Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: Expanded(
                      flex: 2,
                      child: CircleAvatar(
                        backgroundColor: Colors.white,
                        child: FlutterLogo(),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 10,
                    child: Text(
                        "${remainUser[senderID]!['HoTen']}\n${NumberFormat("\$#,##0").format((remainUser[senderID]!['money']))}"),
                  )
                ],
              )),
        ),
        SizedBox(
          height: 10,
        ),
        //Receiver
        Padding(
          padding: EdgeInsets.only(left: 50),
          child: Container(
              decoration: BoxDecoration(
                color: Colors.lightGreen,
                borderRadius:
                    BorderRadius.only(bottomLeft: Radius.circular(35)),
              ),
              constraints: BoxConstraints(minHeight: 70, maxHeight: 70),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    flex: 10,
                    child: Text("${allUser[receiverID]!['HoTen']}\n${allUser[receiverID]!['name']}", textAlign: TextAlign.end),
                  ),
                  Expanded(
                    flex: 2,
                    child: CircleAvatar(
                      backgroundColor: Colors.white,
                      child: FlutterLogo(),
                    ),
                  ),
                ],
              )),
        ),
        SizedBox(
          height: 10,
        ),
        // Input tên đăng nhập
        Padding(
            padding: const EdgeInsets.fromLTRB(20, 0, 20, 10),
            child: StreamBuilder(
              stream: bloc.sotienStream,
              builder: (context, snapshot) => TextField(
                keyboardType: TextInputType.number,
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.digitsOnly
                ],
                controller: _sotienController,
                style: TextStyle(fontSize: 18, color: Colors.black),
                onSubmitted: (value) {},
                decoration: InputDecoration(
                    labelText: "Nhập số tiền cần chuyển",
                    errorText:
                        snapshot.hasError ? snapshot.error.toString() : null,
                    border: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Color(0xffCED0D2), width: 1),
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    )),
              ),
            )),
        Padding(
            padding: const EdgeInsets.fromLTRB(20, 0, 20, 10),
            child: StreamBuilder(
              stream: bloc.tinnhanStream,
              builder: (context, snapshot) => TextField(
                controller: _tinnhanController,
                style: TextStyle(fontSize: 18, color: Colors.black),
                decoration: InputDecoration(
                    labelText: "Nhập tin nhắn cần chuyển",
                    errorText:
                        snapshot.hasError ? snapshot.error.toString() : null,
                    border: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Color(0xffCED0D2), width: 1),
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    )),
              ),
            )),
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 0, 20, 10),
          child: SizedBox(
            width: double.infinity,
            height: 56,
            child: ElevatedButton(
              onPressed: () {
                if (bloc.isValidAcc(
                    _sotienController.text, _tinnhanController.text)) {
                  if (remainUser[senderID]!['money'] <
                      int.parse(_sotienController.text)) {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: Text("Thông báo"),
                            content: Text("Số tiền trong tài khoản không đủ"),
                            actions: [
                              TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: Text("OK"))
                            ],
                          );
                        });
                  } else {
                    auth.isDeviceSupported().then((isSupported) {
                      if (isSupported) {
                        auth
                            .authenticate(
                                localizedReason: "Xác thực để chuyển tiền",
                                biometricOnly: true,
                                stickyAuth: true)
                            .then((value) {
                          //SendInMoney last = SendInMoney(senderID: testUser.name, receiverID: receiverID, amount: int.parse(_sotienController.text), content: _tinnhanController.text);
                          if (value) {
                            // db.updateDataInDatabase(
                            //     remainUser.keys.first,
                            //     'money',
                            //     (remainUser.values.first['money'] -
                            //             int.parse(_sotienController.text))
                            //         .toString());
                            // //Lấy thông tin người gửi để cập nhật
                            // db.updateDataInDatabase(
                            //     receiverID,
                            //     'money',
                            //     (allUser[receiverID]!['money'] +
                            //             int.parse(_sotienController.text))
                            //         .toString());
                            remainUser.values.first['money'] = remainUser.values.first['money'] -
                                int.parse(_sotienController.text);
                            allUser[receiverID]!['money'] = allUser[receiverID]!['money'] +
                                int.parse(_sotienController.text);
                            db.addNewRowToDatabase('history', {
                              'senderID': senderID,
                              'receiverID': receiverID,
                              'amount': _sotienController.text,
                              'content': _tinnhanController.text,
                              'time': DateTime.now().toString()
                            });
                            showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    title: Text("Thông báo"),
                                    content: Text(
                                        "Chuyển tiền thành công.\nSố tài khoản nhận: ${receiverID}.\nSố tiền: ${_sotienController.text}.\nNội dung: ${_tinnhanController.text}"),
                                    actions: [
                                      TextButton(
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          },
                                          child: Text("OK"))
                                    ],
                                  );
                                });
                          } else {
                            showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    title: Text("Thông báo"),
                                    content: Text("Chuyển tiền thất bại"),
                                    actions: [
                                      TextButton(
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          },
                                          child: Text("OK"))
                                    ],
                                  );
                                });
                          }
                        });
                      } else
                        showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                title: Text("Thông báo"),
                                content: Text("Không có phương thức xác thực"),
                                actions: [
                                  TextButton(
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                      child: Text("OK"))
                                ],
                              );
                            });
                    });
                    /* SendInMoney last = SendInMoney(senderID: testUser.name, receiverID: receiverID, amount: int.parse(_sotienController.text), content: _tinnhanController.text);
                  last.Sent(last.amount); */

                  }
                }
              },
              child: Text(
                "Chuyển tiền",
                // cho chữ đăng nhập to hơn
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
            ),
          ),
        ),

        //Money
      ],
    ));
  }
}

class AujustText extends StatelessWidget {
  final String text;
  AujustText(this.text, {Key? key}) : super(key: key);

  DatabaseProcess db = DatabaseProcess();
  User user = User();

  String content() {
    late String receiverID;
    db.getChildNameByAttribute('name', text).then((value) {
      receiverID = value;
    });
    RemainUser receiverUser = RemainUser(receiverID);
    return "${receiverUser.user.name}\n${receiverUser.user.accountName}";
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      content(),
      textAlign: TextAlign.center,
    );
  }
}
