import 'package:flutter/material.dart';
import 'package:flutter_huntd_demo/models/user.dart';
import 'package:flutter_huntd_demo/services/user_service.dart';

enum Status {
  NotLoggedIn,
  LoggedIn,
  Authenticating,
  LoggedOut,
}

class AuthProvider with ChangeNotifier {
  Status _loggedInStatus = Status.NotLoggedIn;

  Status get loggedInStatus => _loggedInStatus;

  Future<Map<String, dynamic>> login(String email, String password) async {
    // For now, I hard coded user login fields.
    // For the future, we will send request to API.
    var credentials = {
      'email': 'tragenstolz@gmail.com',
      'password': 'mate',
    };

    _loggedInStatus = Status.Authenticating;
    notifyListeners();

    if (credentials['email'] == email && credentials['password'] == password) {
      User authUser = User(
        email: email,
        name: 'Dmytro',
        token: 'token',
        refreshToken: 'refreshToken',
      );

      UserService().saveUser(authUser);

      _loggedInStatus = Status.LoggedIn;
      notifyListeners();

      return {'logged': true, 'message': 'success', 'user': authUser};
    } else {
      _loggedInStatus = Status.NotLoggedIn;
      notifyListeners();

      return {'logged': false, 'message': 'incorrect password'};
    }
  }

  Future<bool> logout() async {
    _loggedInStatus = Status.LoggedOut;
    notifyListeners();

    UserService().removeUser();

    return true;
  }
}
