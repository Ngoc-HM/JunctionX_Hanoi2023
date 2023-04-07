import 'package:flutter/material.dart';
import './menuLogin/menuLogin.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          body: Container(
        padding: EdgeInsets.fromLTRB(30, 0, 30, 0),
        constraints: BoxConstraints.expand(),
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            // hình ảnh Flutter
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 40),
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
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 40),
              child: Text(
                "Xin chào \nFintech Of JunctionX Hanoi 2023",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    fontSize: 30),
              ),
            ),
            // Input tên đăng nhập
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 40),
              child: TextField(
                style: TextStyle(fontSize: 18, color: Colors.black),
                decoration: InputDecoration(
                  labelText: "Tên đăng nhập",
                  labelStyle: TextStyle(color: Color(0xff888888), fontSize: 15),
                ),
              ),
            ),
            // Input mật khẩu
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 40),
              child: Stack(
                  alignment: AlignmentDirectional.centerEnd,
                  children: <Widget>[
                    TextField(
                      style: TextStyle(fontSize: 18, color: Colors.black),
                      obscureText: true,
                      decoration: InputDecoration(
                        labelText: "Mật Khẩu",
                        labelStyle:
                            TextStyle(color: Color(0xff888888), fontSize: 15),
                      ),
                    ),
                    Text(
                      "Hiển thị",
                      style: TextStyle(
                          color: Colors.blue,
                          fontSize: 13,
                          fontWeight: FontWeight.bold),
                    )
                  ]),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 40),
              child: SizedBox(
                width: double.infinity,
                height: 56,
                child: ElevatedButton(
                  onPressed: () {},
                  child: Text(
                    "Đăng nhập",
                    // cho chữ đăng nhập to hơn
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ),
              ),
            ),
            Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 40),
                child: Container(
                  height: 130,
                  width: double.infinity,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Flexible(
                        flex: 3,
                        child: TextButton(
                          onPressed: () {},
                          child: Text(
                            "Bạn chưa có Tài Khoản ?",
                            style: TextStyle(color: Colors.blue, fontSize: 15),
                          ),
                        ),
                      ),
                      Flexible(
                        flex: 2,
                        child: TextButton(
                          onPressed: () {},
                          child: Text(
                            "Quên Mật Khẩu",
                            style: TextStyle(color: Colors.blue, fontSize: 15),
                          ),
                        ),
                      )
                    ],
                  ),
                )),
            // thêm
          ],
        ),
      )),
    );
  }
}
