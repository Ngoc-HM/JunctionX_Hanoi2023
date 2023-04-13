// ignore_for_file: non_constant_identifier_names

import 'dart:async';

import 'package:fintechdemo/src/blocs/fire_base/fire_base_auth.dart';

class AuthBloc {
  var _firebaseAuth = FireAuth();
  StreamController _nameController = new StreamController();
  StreamController _HoTenController = new StreamController();
  StreamController _emailController = new StreamController();
  StreamController _phoneController = new StreamController();
  StreamController _passwordController = new StreamController();
  StreamController _confirmPasswordController = new StreamController();
  StreamController _password2Controller = new StreamController();

  Stream get nameStream => _nameController.stream;
  Stream get HoTenStream => _HoTenController.stream;
  Stream get emailStream => _emailController.stream;
  Stream get phoneStream => _phoneController.stream;
  Stream get passwordStream => _passwordController.stream;
  Stream get confirmPasswordStream => _confirmPasswordController.stream;
  Stream get password2Stream => _password2Controller.stream;

  bool isValidAcc(String name, String HoTen, String email, String phone,
      String pass, String passconfirm, String Pass2) {
    if (name == null || name.length == 0) {
      _nameController.sink.addError("Tên không được để trống");
      return false;
    }
    _nameController.sink.add("");
    if (HoTen == null || HoTen.length == 0) {
      _HoTenController.sink.addError("Họ tên không được để trống");
      return false;
    }
    _HoTenController.sink.add("");
    if (email == null || email.length == 0) {
      _emailController.sink.addError("Email không được để trống");
      return false;
    }
    _emailController.sink.add("");
    if (phone == null || phone.length == 0) {
      _phoneController.sink.addError("Số điện thoại không được để trống");
      return false;
    }
    _phoneController.sink.add("");
    if (pass == null || pass.length == 0 || pass.length < 6) {
      _passwordController.sink.addError("Mật khẩu không được để trống");
      return false;
    }
    _passwordController.sink.add("");
    if (passconfirm == null || passconfirm.length == 0 || pass != passconfirm) {
      _confirmPasswordController.sink.addError("Mật khẩu không trùng khớp");
      return false;
    }
    _confirmPasswordController.sink.add("");

    if (Pass2 == null || Pass2.length == 0) {
      _password2Controller.sink.addError("Mật khẩu cấp 2 không được để trống");
      return false;
    }
    _password2Controller.sink.add("");
    return true;
  }
  void signUp(String name, String HoTen, String email, String phone,
      String pass, String pass2 ,int sodu, Function onSuccess) {

    _firebaseAuth.signUp(name, HoTen, email, phone, pass, pass2 ,1000000, onSuccess);


  }

  void dispose() {
    _nameController.close();
    _HoTenController.close();
    _emailController.close();
    _phoneController.close();
    _passwordController.close();
    _confirmPasswordController.close();
    _password2Controller.close();
  }
}
