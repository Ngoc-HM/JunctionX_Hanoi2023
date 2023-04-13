import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import './src/app.dart';
import 'firebase_options.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}
// bạn Hành đã ở đây !
