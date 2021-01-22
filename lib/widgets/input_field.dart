import 'package:flutter/material.dart';
import 'package:flutter_huntd_demo/widgets/text_field_container.dart';

class InputField extends StatelessWidget {
  final String label;
  final String hintText;
  final ValueChanged<String> onChanged;
  final bool secure;

  const InputField({
    Key key,
    this.label,
    this.secure = false,
    @required this.hintText,
    @required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      label: label,
      child: TextFormField(
        onChanged: onChanged,
        decoration: InputDecoration(
          hintText: hintText,
          border: InputBorder.none,
        ),
        obscureText: secure,
      ),
    );
  }
}
