import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  final Color? buttonColor;
  final Color? textColor;

  const CustomButton({
    Key? key,
    required this.text,
    required this.onTap,
    this.buttonColor,
    this.textColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        minimumSize: const Size(
          double.infinity,
          50,
        ),
        primary: buttonColor,
      ),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w400,
          color: textColor ?? Colors.white,
        ),
      ),
    );
  }
}
