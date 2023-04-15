import 'dart:async';
import 'package:fintechdemo/src/resources/registration_status.dart';
import 'package:flutter/material.dart';
import 'login_page.dart';
import '../blocs/RegisterAccount.dart';
import '../blocs/fire_base/fire_base_auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';

class CreateAccount extends StatefulWidget {
  @override
  _CreateAccountState createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount> {
  AuthBloc authBloc = new AuthBloc();
  TextEditingController _nameController = new TextEditingController();
  TextEditingController _HoTenController = new TextEditingController();
  TextEditingController _emailController = new TextEditingController();
  TextEditingController _phoneController = new TextEditingController();
  TextEditingController _passwordController = new TextEditingController();
  TextEditingController _confirmPasswordController =
      new TextEditingController();
  TextEditingController _password2Controller = new TextEditingController();
  @override
  void dispose() {
    authBloc.dispose();
    super.dispose();
  }

  bool _nameValid = false;
  bool _HoTenValid = false;
  bool _emailValid = false;
  bool _phoneValid = false;
  bool _passwordValid = false;
  bool _confirmPasswordValid = false;
  bool _password2Valid = false;
  final referenceDatase = FirebaseDatabase.instance;
  bool showPass = true;
  @override
  Widget build(BuildContext context) {
    final ref = referenceDatase.reference();
    return MaterialApp(
      title: 'Đăng Kí Thành Viên Mới',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Đăng Kí Thành Viên Mới'),
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
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 30),
                  child: Text(
                    "Trang đăng kí thành viên",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        fontSize: 30),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                  child: StreamBuilder(
                    stream: authBloc.nameStream,
                    builder: (context, snapshot) => TextField(
                      controller: _nameController,
                      style: TextStyle(fontSize: 18, color: Colors.black),
                      decoration: InputDecoration(
                          errorText: snapshot.hasError
                              ? snapshot.error.toString()
                              : null,
                          labelText: "Tên đăng nhập",
                          // prefixIcon: Icon(Icons.account_circle),
                          border: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Color(0xffCED0D2), width: 1),
                            borderRadius: BorderRadius.all(Radius.circular(6)),
                          )),
                      // labelStyle:
                      //     TextStyle(color: Color(0xff888888), fontSize: 15),
                    ),
                  ),
                ),
                // Input tên đăng nhập
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                  child: StreamBuilder(
                    stream: authBloc.HoTenStream,
                    builder: (context, snapshot) => TextField(
                      controller: _HoTenController,
                      style: TextStyle(fontSize: 18, color: Colors.black),
                      decoration: InputDecoration(
                          errorText: snapshot.hasError
                              ? snapshot.error.toString()
                              : null,
                          labelText: "Họ và Tên",
                          // prefixIcon: Icon(Icons.account_circle),
                          border: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Color(0xffCED0D2), width: 1),
                            borderRadius: BorderRadius.all(Radius.circular(6)),
                          )),
                      // labelStyle:
                      //     TextStyle(color: Color(0xff888888), fontSize: 15),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                  child: StreamBuilder(
                    stream: authBloc.emailStream,
                    builder: (context, snapshot) => TextField(
                      controller: _emailController,
                      style: TextStyle(fontSize: 18, color: Colors.black),
                      decoration: InputDecoration(
                          labelText: "Nhập địa chỉ email",
                          errorText: snapshot.hasError
                              ? snapshot.error.toString()
                              : null,
                          border: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Color(0xffCED0D2), width: 1),
                            borderRadius: BorderRadius.all(Radius.circular(6)),
                          )),
                      // labelStyle:
                      //     TextStyle(color: Color(0xff888888), fontSize: 15),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                  child: StreamBuilder(
                    stream: authBloc.phoneStream,
                    builder: (context, snapshot) => TextField(
                      controller: _phoneController,
                      style: TextStyle(fontSize: 18, color: Colors.black),
                      decoration: InputDecoration(
                          labelText: "Nhập số điện thoại",
                          errorText: snapshot.hasError
                              ? snapshot.error.toString()
                              : null,
                          border: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Color(0xffCED0D2), width: 1),
                            borderRadius: BorderRadius.all(Radius.circular(6)),
                          )),
                      // labelStyle:
                      //     TextStyle(color: Color(0xff888888), fontSize: 15),
                    ),
                  ),
                ),
                // Input mật khẩu
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                  child: StreamBuilder(
                    stream: authBloc.passwordStream,
                    builder: ((context, snapshot) => TextField(
                          controller: _passwordController,
                          style: TextStyle(fontSize: 18, color: Colors.black),
                          decoration: InputDecoration(
                              errorText: snapshot.hasError
                                  ? snapshot.error.toString()
                                  : null,
                              labelText: "Nhập mật khẩu",
                              border: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Color(0xffCED0D2), width: 1),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(6)),
                              )),
                        )),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                  child: StreamBuilder(
                    stream: authBloc.confirmPasswordStream,
                    builder: ((context, snapshot) => TextField(
                          controller: _confirmPasswordController,
                          style: TextStyle(fontSize: 18, color: Colors.black),
                          decoration: InputDecoration(
                              errorText: snapshot.hasError
                                  ? snapshot.error.toString()
                                  : null,
                              labelText: "Nhập lại mật khẩu",
                              border: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Color(0xffCED0D2), width: 1),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(6)),
                              )),
                        )),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                  child: StreamBuilder(
                    stream: authBloc.password2Stream,
                    builder: ((context, snapshot) => TextField(
                          controller: _password2Controller,
                          style: TextStyle(fontSize: 18, color: Colors.black),
                          decoration: InputDecoration(
                              errorText: snapshot.hasError
                                  ? snapshot.error.toString()
                                  : null,
                              labelText: "Nhập mật khẩu cấp 2",
                              border: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Color(0xffCED0D2), width: 1),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(6)),
                              )),
                        )),
                  ),
                ),
                Padding(
                    padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
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
                                ref.child("user").push().set({
                                  "name": _nameController.text,
                                  "HoTen": _HoTenController.text,
                                  "email": _emailController.text,
                                  "phone": _phoneController.text,
                                  "password": _passwordController.text,
                                  "password2": _password2Controller.text,
                                  "money": 10000000,
                                }).asStream();

                                // authBloc.isValidAcc(
                                //   _nameController.text,
                                //   _HoTenController.text,
                                //   _emailController.text,
                                //   _phoneController.text,
                                //   _passwordController.text,
                                //   _confirmPasswordController.text,
                                //   _password2Controller.text,
                                // );

                                // authBloc.signUp(
                                //     _nameController.text,
                                //     _HoTenController.text,
                                //     _emailController.text,
                                //     _phoneController.text,
                                //     _passwordController.text,
                                //     _password2Controller.text,
                                //     10000000, () {
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            CreateNewAccountSuccessfully()));
                              },
                              child: Text(
                                "Đăng kí",
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
