import 'package:fintechdemo/src/blocs/database_process.dart';
import '../resources/login_page.dart';

class User {
  String _name = "";
  String get name => _name;
  set name(String newName) {
    name = newName;
  }

  String _accountName = "";
  String get accountName => _accountName;
  set accountName(String newName) {
    accountName = newName;
  }

  int _money = 0;
  int get money => _money;
  set money(int newMoney) {
    if (newMoney < 0) throw Exception("Money not zero");
    money = newMoney;
  }

  User([String name = "", String accountName = "", int money = 0, ]) {
    _name = name;
    _money = money;
    _accountName = accountName;
  }

  User.fromJson(Map<String, String?> json) {
    _name = json['HoTen']!; //full name
    _money = int.parse(json['money']!); //balance
    _accountName = json['name']!; //account name
  }
}

class RemainUser {
  User user = User();
  late String USER_ID;
  RemainUser(String user_id) {
    USER_ID = user_id;
  }

}

late Map<dynamic, Map<dynamic, dynamic>> remainUser;
late Map<dynamic, Map<dynamic, dynamic>> allUser;

