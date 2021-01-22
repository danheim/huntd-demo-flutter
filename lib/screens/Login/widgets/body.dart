import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_huntd_demo/constants.dart';
import 'package:flutter_huntd_demo/models/user.dart';
import 'package:flutter_huntd_demo/providers/auth_provider.dart';
import 'package:flutter_huntd_demo/providers/user_provider.dart';
import 'package:flutter_huntd_demo/widgets/button.dart';
import 'package:flutter_huntd_demo/widgets/input_field.dart';
import 'package:provider/provider.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final formKey = new GlobalKey<FormState>();
  String _email = '', _password = '';

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    AuthProvider authProvider = context.read<AuthProvider>();

    Future<void> handleSubmit() async {
      final formState = formKey.currentState;
      formState.save();

      final authResponse = await authProvider.login(_email, _password);
      print(authResponse);

      if (authResponse['logged']) {
        User user = authResponse['user'];
        context.read<UserProvider>().setUser(user);
        Navigator.pushReplacementNamed(context, '/home');
      } else {
        Flushbar(
          title: "Failed Login",
          message: authResponse['message'].toString(),
          duration: Duration(seconds: 2),
          backgroundColor: colorCitrus,
        ).show(context);
      }
    }

    return Container(
      height: size.height,
      width: double.infinity,
      child: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 52),
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Sign in to your account',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    color: colorCitrus,
                  ),
                ),
                SizedBox(height: 32),
                InputField(
                  label: 'Email',
                  hintText: 'Email',
                  onChanged: (value) => _email = value,
                ),
                InputField(
                  label: 'Password',
                  hintText: 'Password',
                  onChanged: (value) => _password = value,
                  secure: true,
                ),
                Button(
                  text: 'Sign In',
                  press: handleSubmit,
                  color: colorCitrus,
                  textColor: Colors.white,
                ),
                SizedBox(height: 16),
                GestureDetector(
                  onTap: () {},
                  child: Text(
                    'Forgot password',
                    style: TextStyle(color: colorCitrus, fontSize: 14),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
