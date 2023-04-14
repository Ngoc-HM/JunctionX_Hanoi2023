class Validations {
  static final Map<String, String> validReceiver = {
    "0123456789": "VU THI HANG",
    "0982934052": "HOANG NGOC MINH"
  };

  static bool isValidUser(String user) {
    return user != null && user.length >= 6;
  }

  static bool isValidPassword(String password) {
    return password != null && password.length >= 6;
  }

  static bool isValidReceiver(String receiver) {
    return validReceiver.keys.contains(receiver);
  }
}
