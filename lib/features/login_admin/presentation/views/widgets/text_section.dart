
import 'package:flutter/material.dart';

class TextSection extends StatelessWidget {
  const TextSection({
    super.key,

  });

 

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Column(
      children: [
        SizedBox(
          height: height * 0.2,
        ),
        const Text(
          "Welcome to MainTainX! Lets make you",
          style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 50,),
        ),
        Text(
          "and your team more efficient.",
          style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: width * 0.03),
        ),
        SizedBox(height: height * 0.05),
      ],
    );
  }
}
