import 'package:flutter/material.dart';
import 'package:flutter_huntd_demo/models/user.dart';
import 'package:flutter_huntd_demo/providers/auth_provider.dart';
import 'package:flutter_huntd_demo/providers/user_provider.dart';
import 'package:flutter_huntd_demo/widgets/button.dart';
import 'package:provider/provider.dart';

class HomeBody extends StatelessWidget {
  final int tabIndex;

  static const List<Widget> _tabs = <Widget>[
    Text('This is chat page'),
    Text('This is profile page'),
  ];

  HomeBody({this.tabIndex});

  @override
  Widget build(BuildContext context) {
    AuthProvider authProvider = context.read<AuthProvider>();
    User user = context.read<UserProvider>().user;

    Future<void> handleLogout() async {
      await authProvider.logout();
      context.read<UserProvider>().clearUser();
      Navigator.pushReplacementNamed(context, '/login');
    }

    return SafeArea(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Welcome, ${user.name}',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                ),
              ),
              SizedBox(height: 24),
              _tabs.elementAt(tabIndex),
              SizedBox(height: 24),
              Button(
                text: 'Logout',
                press: handleLogout,
              )
            ],
          ),
        ),
      ),
    );
  }
}
