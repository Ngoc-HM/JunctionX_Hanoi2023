import 'package:local_auth/local_auth.dart';
//use biological authentication to confirm the user's identity
class BiometricAuth {
  final LocalAuthentication _localAuthentication = LocalAuthentication();
  //check if the device supports biometric authentication
  Future<bool> canCheckBiometrics() async {
    bool canCheckBiometrics = false;
    try {
      canCheckBiometrics = await _localAuthentication.canCheckBiometrics;
    } catch (e) {
      print(e);
    }
    return canCheckBiometrics;
  }
  //check if the user has enrolled biometric authentication
  Future<List<BiometricType>> getAvailableBiometrics() async {
    List<BiometricType> availableBiometrics = [];
    try {
      availableBiometrics =
          await _localAuthentication.getAvailableBiometrics();
    } catch (e) {
      print(e);
      return [];
    }
    return availableBiometrics;
  }
  //authenticate the user
  Future<bool> authenticate(String message) async {
    bool authenticated = false;
    try {
      authenticated = await _localAuthentication.authenticate(
        localizedReason: message,
        useErrorDialogs: true,
        stickyAuth: true,
        biometricOnly: true,
      );
    } catch (e) {
      print(e);
    }
    return authenticated;
  }
}