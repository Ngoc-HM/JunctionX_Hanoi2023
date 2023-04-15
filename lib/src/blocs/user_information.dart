import 'package:fintechdemo/src/blocs/database_process.dart';

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
  static DatabaseProcess db = DatabaseProcess();
  RemainUser(String user_id) {
    USER_ID = user_id;

  }

  Future<void> Update() async {
    var userMap = await db.getDataFromDatabase(USER_ID);
    user.name = userMap['HoTen']!; //full name
    user.money = int.parse(userMap['money']!); //balance
    user.accountName = userMap['name']!; //account name
  }
}

String USER_ID = "";
RemainUser remainUser = RemainUser(USER_ID);