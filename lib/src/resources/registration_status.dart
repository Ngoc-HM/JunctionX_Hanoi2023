import 'package:flutter/material.dart';

import 'login_page.dart';

class CreateNewAccountSuccessfully extends StatelessWidget {
  bool showPass = true;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Đăng kí thành viên mới thành công',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Đăng kí thành viên mới thành công'),
        ),
        body: Container(
            padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
            constraints: BoxConstraints.expand(),
            color: Colors.white,
            child: Wrap(
              alignment: WrapAlignment.center,
              // mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: WrapCrossAlignment.start,
              children: <Widget>[
                // hình ảnh Flutter
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
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
                    "Đăng kí thành viên mới \n         Thành Công",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        fontSize: 30),
                  ),
                ),
                // Input tên đăng nhập
                // thêm ảnh thanhcong.png vào
                Image.asset(
                  'assets/images/thanhcong.png',
                  width: 500,
                  height: 300,
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
                                "Quay lại trang đăng nhập",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 15),
                              ),
                            ),
                          ),
                          // thêm một khoảng trống giữa 2 nút
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

class FailedToCreateNewAccount extends StatelessWidget {
  bool showPass = true;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Đăng kí thành viên mới thành công',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Đăng kí thành viên mới thành công'),
        ),
        body: Container(
            padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
            constraints: BoxConstraints.expand(),
            color: Colors.white,
            child: Wrap(
              alignment: WrapAlignment.center,
              // mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: WrapCrossAlignment.start,
              children: <Widget>[
                // hình ảnh Flutter
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
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
                    "Đăng kí thành viên mới \n         Thất Bại",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        fontSize: 30),
                  ),
                ),
                // Input tên đăng nhập
                // thêm ảnh thanhcong.png vào
                Image.asset(
                  'assets/images/thanhcong.png',
                  width: 500,
                  height: 300,
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

class ResetPassWordSuccessfully extends StatelessWidget {
  bool showPass = true;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Đặt lại mật khẩu thành công',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Đặt lại mật khẩu mới thành công'),
        ),
        body: Container(
            padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
            constraints: BoxConstraints.expand(),
            color: Colors.white,
            child: Wrap(
              alignment: WrapAlignment.center,
              // mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: WrapCrossAlignment.start,
              children: <Widget>[
                // hình ảnh Flutter
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
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
                    "Đặt lại mật khẩu mới \n         Thành Công",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        fontSize: 30),
                  ),
                ),
                // Input tên đăng nhập
                // thêm ảnh thanhcong.png vào
                Image.asset(
                  'assets/images/thanhcong.png',
                  width: 500,
                  height: 300,
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
                                "Quay lại trang đăng nhập",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 15),
                              ),
                            ),
                          ),
                          // thêm một khoảng trống giữa 2 nút
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
