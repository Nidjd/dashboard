import 'package:flutter/material.dart';

class CustomTextButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;
  final TextStyle textStyle;
  final Color backGroundColor;
  final Icon? icon;

  const CustomTextButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.textStyle = const TextStyle(),
    this.backGroundColor = Colors.transparent,
    this.icon,
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
        child: Row(
          // mainAxisAlignment: MainAxisAlignment.start,
          //  crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (icon != null)
              icon!, // Use the icon! to unwrap the nullable value

            const SizedBox(
              width: 10,
            ),
            Text(
              label,
              style: textStyle,
            ),
          ],
        ));
  }
}
