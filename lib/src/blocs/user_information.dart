class User {
  String _name = "";
  String get name => _name;
  set name(String newName) {
    name = newName;
  }

  int _money = 0;
  int get money => _money;
  set money(int newMoney) {
    if (newMoney < 0) throw Exception("Money not zero");
    money = newMoney;
  }

  User([String name = "", int money = 0]) {
    _name = name;
    _money = money;
  }
}

User testUser = User("HOANG MINH NGOC", 10000000);
