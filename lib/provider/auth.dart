import 'package:flutter/foundation.dart';

class Auth with ChangeNotifier {
  String email = 'admin';
  String pass = 'admin';
  bool loginGranted = true;

  void login(String email, String pass) async {
    if (this.email == email && this.pass == pass) {
      await Future.delayed(Duration(milliseconds: 500));
      loginGranted = true;
    }
    notifyListeners();
  }

  void logout() async {
    await Future.delayed(Duration(milliseconds: 500));
    loginGranted = false;
    notifyListeners();
  }
}
