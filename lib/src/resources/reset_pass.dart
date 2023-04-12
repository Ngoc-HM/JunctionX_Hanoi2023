import 'package:flutter/material.dart';

class ResetPass extends StatelessWidget {
  bool showPass = true;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Đặt lại mật khẩu',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Đặt lại mật khẩu'),
        ),
        body: Container(
            padding: EdgeInsets.fromLTRB(30, 0, 30, 0),
            constraints: BoxConstraints.expand(),
            color: Colors.white,
            child: Wrap(
              alignment: WrapAlignment.center,
              // mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: WrapCrossAlignment.start,
              children: <Widget>[
                // hình ảnh Flutter
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 30),
                  child: Container(
                    width: 90,
                    height: 90,
                    padding: EdgeInsets.all(15),
                    child: FlutterLogo(),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color(0xffd8d8d8),
                    ),
                  ),
                ),
                // lời chào mừng
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 40, 0, 30),
                  child: Text(
                    "Đặt lại mật khẩu của bạn",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        fontSize: 30),
                  ),
                ),
                // Input tên đăng nhập
                Padding(
                    padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
                    child: StreamBuilder(
                      builder: (context, snapshot) => TextField(
                        style: TextStyle(fontSize: 18, color: Colors.black),
                        decoration: InputDecoration(
                          labelText: "Nhập tên đăng nhập",
                          errorText: snapshot.hasError
                              ? snapshot.error.toString()
                              : null,
                          labelStyle:
                              TextStyle(color: Color(0xff888888), fontSize: 15),
                        ),
                      ),
                    )),
                // Input mật khẩu
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
                  child: Stack(
                      alignment: AlignmentDirectional.centerEnd,
                      children: <Widget>[
                        StreamBuilder(
                          builder: ((context, snapshot) => TextField(
                                style: TextStyle(
                                    fontSize: 18, color: Colors.black),
                                decoration: InputDecoration(
                                  labelText: "Nhập lại mật khẩu",
                                  errorText: snapshot.hasError
                                      ? snapshot.error.toString()
                                      : null,
                                  labelStyle: TextStyle(
                                      color: Color(0xff888888), fontSize: 15),
                                ),
                              )),
                        ),
                      ]),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
                  child: Stack(
                      alignment: AlignmentDirectional.centerEnd,
                      children: <Widget>[
                        StreamBuilder(
                          builder: ((context, snapshot) => TextField(
                                style: TextStyle(
                                    fontSize: 18, color: Colors.black),
                                decoration: InputDecoration(
                                  labelText: "Nhập lại mật khẩu",
                                  errorText: snapshot.hasError
                                      ? snapshot.error.toString()
                                      : null,
                                  labelStyle: TextStyle(
                                      color: Color(0xff888888), fontSize: 15),
                                ),
                              )),
                        ),
                      ]),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 0, 80),
                  child: SizedBox(
                    width: double.infinity,
                    height: 56,
                    child: ElevatedButton(
                      onPressed: () {},
                      child: Text(
                        "Đổi mật khẩu",
                        // cho chữ đăng nhập to hơn
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                    ),
                  ),
                ),
              ],
            )),
        // thêm
      ),
    );
  }
}
