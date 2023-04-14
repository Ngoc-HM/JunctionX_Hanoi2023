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
}

User testUser = User("HOANG NGOC MINH", "test@gmail.com" ,10000000);
