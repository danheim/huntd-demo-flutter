import 'package:flutter/material.dart';
import 'package:flutter_huntd_demo/constants.dart';

class TextFieldContainer extends StatelessWidget {
  final Widget child;
  final String label;

  TextFieldContainer({
    Key key,
    @required this.child,
    @required this.label,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (label is String)
          Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: Text(label, style: TextStyle(fontSize: 14)),
          ),
        Container(
          margin: const EdgeInsets.only(bottom: 24),
          padding: const EdgeInsets.symmetric(horizontal: 18),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(4),
            border: Border.all(style: BorderStyle.solid, color: colorLightGray),
          ),
          child: child,
        ),
      ],
    );
  }
}
