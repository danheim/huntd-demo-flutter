import 'dart:async';

import 'package:flutter_huntd_demo/models/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserService {
  Future<bool> saveUser(User user) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.setString("email", user.email);
    prefs.setString("name", user.name);
    prefs.setString("token", user.token);
    prefs.setString("refreshToken", user.refreshToken);

    return true;
  }

  Future<User> getUser() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    String email = prefs.getString("email");
    String name = prefs.getString("name");
    String token = prefs.getString("token");
    String refreshToken = prefs.getString("refreshToken");

    return User(
      email: email,
      token: token,
      refreshToken: refreshToken,
      name: name,
    );
  }

  void removeUser() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.remove("email");
    prefs.remove("name");
    prefs.remove("token");
  }

  Future<String> getToken(args) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString("token");
    return token;
  }
}
