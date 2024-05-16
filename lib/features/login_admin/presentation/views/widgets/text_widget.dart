import 'package:flutter/material.dart';

class TextWidget extends StatelessWidget {
  final text;
  const TextWidget({
    super.key,
    required this.screenWidth,
    this.text,
  });

  final double screenWidth;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: screenWidth * 0.3,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            text,
            style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: screenWidth * 0.015),
          ),
          const Text(
            ' (required)',
            // textAlign: TextAlign.start,
            style: TextStyle(
              color: Colors.black38,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}