import 'package:flutter/material.dart';

class LongButton extends StatelessWidget {
  const LongButton({
    Key? key,
    this.width,
    this.height,
    this.bgColor,
    this.text,
    this.textColor,
    this.onTap,
  }) : super(key: key);

  final double? width;
  final double? height;
  final Color? bgColor;
  final String? text;
  final Color? textColor;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: width == null ? 300 : width! * 0.8,
        height: height ?? 40,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(
            30,
          ),
          color: bgColor ?? const Color.fromARGB(255, 1, 28, 49),
        ),
        child: Text(
          text ?? "",
          style: TextStyle(
            color: textColor ?? Colors.white,
            fontWeight: FontWeight.w800,
            fontSize: 17,
          ),
        ),
      ),
    );
  }
}
