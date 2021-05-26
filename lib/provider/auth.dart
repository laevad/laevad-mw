import 'package:flutter/foundation.dart';

class Auth with ChangeNotifier {
  String email = 'admin';
  String pass = 'admin';
  bool granted = false;

  Future<void> login(String email, String pass) async {
    if (this.email == email && this.pass == pass) {
      granted = true;
    }
    notifyListeners();
  }
}
