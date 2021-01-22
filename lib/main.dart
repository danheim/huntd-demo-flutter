import 'package:flutter/material.dart';
import 'package:flutter_huntd_demo/constants.dart';
import 'package:flutter_huntd_demo/providers/auth_provider.dart';
import 'package:flutter_huntd_demo/providers/user_provider.dart';
import 'package:flutter_huntd_demo/screens/Home/home_screen.dart';
import 'package:flutter_huntd_demo/screens/Login/login_screen.dart';
import 'package:flutter_huntd_demo/services/user_service.dart';
import 'package:provider/provider.dart';

void main() => runApp(HuntdApp());

class HuntdApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => UserProvider()),
        ChangeNotifierProvider(create: (_) => AuthProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Huntd App Demo',
        theme: ThemeData(scaffoldBackgroundColor: colorBackground),
        home: FutureBuilder(
          future: UserService().getUser(),
          builder: (context, snapshot) {
            if (snapshot.connectionState != ConnectionState.done) {
              return CircularProgressIndicator();
            } else if (snapshot.data.token == null) {
              return LoginScreen();
            } else {
              UserService().removeUser();
              return HomeScreen();
            }
          },
        ),
        routes: {
          '/home': (_) => HomeScreen(),
          '/login': (_) => LoginScreen(),
        },
      ),
    );
  }
}
