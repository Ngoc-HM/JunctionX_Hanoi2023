//import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';

class FireAuth {
  FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  get mAuth => null;
  void signUp(
      String name,
      String HoTen,
      String email,
      String phone,
      String pass,
      String Pass2,
      int Sodu,
      Function onSuccess,
      Function(String) onRegisterError) {
    _firebaseAuth
        .createUserWithEmailAndPassword(email: email, password: pass)
        .then((user) {
      //print(user);
      //print("Đăng ký thành công");
      _createUser(
          user.toString(), name, HoTen, email, phone, pass, Pass2, Sodu);
    }).catchError((e) {
      _onSignUpErr(e.code, onRegisterError);
    });
  }

  _createUser(String userID, String name, String HoTen, String email,
      String phone, String pass, String Pass2, int Sodu) {
    final referenceDatase = FirebaseDatabase.instance;
    final refe = referenceDatase.ref();
    refe.child("user").push().set({
      "name": name,
      "HoTen": HoTen,
      "email": email,
      "phone": phone,
      "password": pass,
      "password2": Pass2,
      "money": 10000000,
    }).asStream();
    var user = {
      "name": name,
      "HoTen": HoTen,
      "email": email,
      "phone": phone,
      "pass": pass,
      "Pass2": Pass2,
      "Sodu": Sodu
    };

    var ref = FirebaseDatabase.instance.ref().child("users");
    ref.child(userID).set(user).then((user) {
      print("Đăng ký thành công");
      // onSuccess();
    }).catchError((e) {});
  }

  void _onSignUpErr(String code, Function(String) onRegisterErr) {
    switch (code) {
      case "ERROR_INVALID_EMAIL":
        {
          onRegisterErr("Email không hợp lệ");
          break;
        }
      case "ERROR_EMAIL_ALREADY_IN_USE":
        {
          onRegisterErr("Email đã được sử dụng");
          break;
        }
      case "ERROR_WEAK_PASSWORD":
        {
          onRegisterErr("Mật khẩu quá yếu");
          break;
        }
      default:
        {
          onRegisterErr("Lỗi không xác định");
          break;
        }
    }
  }
}
