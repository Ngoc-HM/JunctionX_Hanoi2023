import 'package:flutter/material.dart';

import 'login_page.dart';
import 'registration_status.dart';

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
                    padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
                    child: Container(
                      height: 130,
                      width: double.infinity,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Flexible(
                            //flex: 3,
                            child: ElevatedButton(
                              onPressed: () {
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => LoginPage()));
                              },
                              child: Text(
                                "Quay lại",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 15),
                              ),
                            ),
                          ),
                          // thêm một khoảng trống giữa 2 nút
                          SizedBox(
                            width: 60,
                          ),
                          Flexible(
                            //flex: 2,
                            child: ElevatedButton(
                              onPressed: () {
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            ResetPassWordSuccessfully()));
                              },
                              child: Text(
                                "Đổi mật khẩu",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 15),
                              ),
                            ),
                          )
                        ],
                      ),
                    )),
              ],
            )),
        // thêm
      ),
    );
  }
}
