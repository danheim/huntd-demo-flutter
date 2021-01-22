import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_huntd_demo/screens/Login/widgets/body.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.dark,
        child: Body(),
      ),
    );
  }
}
