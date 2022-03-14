import 'package:flutter/material.dart';

import 'package:home_garden/constants/app_colors.dart';

class TextFieldContainer extends StatelessWidget {
  const TextFieldContainer({
    Key? key,
    required this.child,
  }) : super(key: key);
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      alignment: Alignment.center,
      margin: const EdgeInsets.symmetric(
        vertical: 10,
      ),
      padding: const EdgeInsets.only(
        top: 10,
        left: 10,
        right: 10,
      ),
      width: size.width * 0.8,
      height: 40,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(29),
        color: textFieldBgColor,
      ),
      child: child,
    );
  }
}
