import 'package:flutter/material.dart';

import 'text_field_container.dart';

class RoundedInputField extends StatelessWidget {
  const RoundedInputField({
    Key? key,
    required this.hintText,
    required this.icon,
    required this.controller,
    required this.onChanged,
    this.hintextColor,
  }) : super(key: key);
  final String hintText;
  final IconData icon;
  final TextEditingController controller;
  final ValueChanged<String> onChanged;
  final Color? hintextColor;

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextField(
        onChanged: onChanged,
        controller: controller,
        textAlign: TextAlign.left,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: TextStyle(
            color: hintextColor,
          ),
          icon: Icon(
            icon,
            size: 20,
          ),
          border: InputBorder.none,
        ),
      ),
    );
  }
}
