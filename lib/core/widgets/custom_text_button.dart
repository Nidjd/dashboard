import 'package:flutter/material.dart';

class CustomTextButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;
  final TextStyle textStyle;
  final Color backGroundColor;

  const CustomTextButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.textStyle = const TextStyle(),
    this.backGroundColor = Colors.transparent,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        backgroundColor: backGroundColor,
        padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 24.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
      ),
      onPressed: onPressed,
      child: Text(
        label,
        style: textStyle,
      ),
    );
  }
}