import 'package:flutter/material.dart';
import 'package:flutter_huntd_demo/constants.dart';

class Button extends StatelessWidget {
  final String text;
  final Function press;
  final Color color, textColor;

  Button({
    Key key,
    this.color = colorCitrus,
    this.textColor = Colors.white,
    @required this.text,
    @required this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      width: size.width,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(4),
        child: FlatButton(
          padding: const EdgeInsets.symmetric(vertical: 16),
          color: color,
          onPressed: press,
          child: Text(
            text.toUpperCase(),
            style: TextStyle(
              color: textColor,
              fontSize: 14,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ),
    );
  }
}
