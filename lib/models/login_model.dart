import 'package:flutter/material.dart';

class LoginModel extends ChangeNotifier {
  String email = "";
  String password = "";

  void setEmail(String email) {
    this.email = email;
    notifyListeners();
  }

  void setPassword(String email) {
    this.password = password;
    notifyListeners();
  }
}
