import 'package:flutter/material.dart';

import 'text_field_container.dart';

class PasswordInputField extends StatefulWidget {
  const PasswordInputField({
    Key? key,
    required TextEditingController passwordController,
    this.hintTextColor,
    this.hintText,
  })  : _passwordController = passwordController,
        super(key: key);

  final TextEditingController _passwordController;
  final Color? hintTextColor;
  final String? hintText;

  @override
  State<PasswordInputField> createState() => _PasswordInputFieldState();
}

class _PasswordInputFieldState extends State<PasswordInputField> {
  bool _obscureText = true;
  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextField(
        onChanged: (value) {},
        obscureText: _obscureText,
        controller: widget._passwordController,
        decoration: InputDecoration(
          hintText: widget.hintText ?? "Password",
          icon: const Icon(
            Icons.lock,
            size: 20,
          ),
          alignLabelWithHint: true,
          hintStyle: TextStyle(
            color: widget.hintTextColor,
          ),
          border: InputBorder.none,
          suffixIcon: InkWell(
            onTap: () {
              setState(() {
                _obscureText = !_obscureText;
              });
            },
            child: const Icon(
              Icons.visibility,
              size: 20,
            ),
          ),
        ),
      ),
    );
  }
}
