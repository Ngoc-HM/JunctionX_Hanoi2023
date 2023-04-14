//import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';

class FireAuth {
  FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  get mAuth => null;
  void signUp(String name, String HoTen, String email, String phone,
      String pass, String Pass2, int Sodu, Function onSuccess) {
    _firebaseAuth
        .createUserWithEmailAndPassword(email: email, password: pass)
        .then((user) {
      //print(user);
      //print("Đăng ký thành công");
      _createUser(user.toString(), name, HoTen, email, phone, pass, Pass2, Sodu,
          onSuccess);
    }).catchError((e) {
      print(e);
      print("Đăng ký thất bại");
    });
  }

  _createUser(String userID, String name, String HoTen, String email,
      String phone, String pass, String Pass2, int Sodu, Function onSuccess) {
    var user = {
      "name": name,
      "HoTen": HoTen,
      "email": email,
      "phone": phone,
      "pass": pass,
      "Pass2": Pass2,
      "Sodu": Sodu
    };
    // ignore: deprecated_member_use
    var ref = FirebaseDatabase.instance.ref().child("users");
    ref.child(userID).set(user).then((user) {
      //print("Đăng ký thành công");
      onSuccess();
    }).catchError((e) {});
  }
}
