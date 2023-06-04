import 'package:flutter/cupertino.dart';
import 'package:phopes/models/firebase/user_model.firebase.dart';

import '../resources/auth.dart';

class UserProvider with ChangeNotifier {
  // global variable
  User? _user;
  final AuthMethods _authMethods = AuthMethods();

  // getter method
  User? get getUser => _user;

  Future<void> refresUser() async {
    User user = await _authMethods.getUserDetail();
    _user = user;
    notifyListeners();
  }
}
