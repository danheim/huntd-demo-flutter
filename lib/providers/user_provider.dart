import 'package:flutter/widgets.dart';
import 'package:flutter_huntd_demo/models/user.dart';

class UserProvider with ChangeNotifier {
  User _user = User();

  User get user => _user;

  void setUser(User user) {
    _user = user;
    notifyListeners();
  }

  void clearUser() {
    _user = null;
    notifyListeners();
  }
}
