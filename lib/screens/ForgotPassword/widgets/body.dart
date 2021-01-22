import 'package:flutter/material.dart';
import 'package:flutter_huntd_demo/constants.dart';

class ForgotPasswordBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      height: size.height,
      width: double.infinity,
      child: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Forgot password'),
              SizedBox(height: 16),
              GestureDetector(
                onTap: () {
                  Navigator.pushReplacementNamed(context, '/login');
                },
                child: Text(
                  'Back to login page',
                  style: TextStyle(color: colorCitrus, fontSize: 14),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
