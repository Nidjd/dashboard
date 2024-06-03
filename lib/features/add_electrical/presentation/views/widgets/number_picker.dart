import 'package:flutter/material.dart';
import 'package:numberpicker/numberpicker.dart';


class IntegerExample extends StatefulWidget {
  const IntegerExample({super.key});

  @override
  IntegerExampleState createState() => IntegerExampleState();
}

class IntegerExampleState extends State<IntegerExample> {
  int _currentIntValue = 5; // Set the initial value to 5

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          icon: const Icon(Icons.remove),
          onPressed: () => setState(() {
            _currentIntValue = (_currentIntValue - 1)
                .clamp(0, 10); // Clamp the value between 0 and 10
          }),
        ),
        NumberPicker(
          value: _currentIntValue,
          minValue: 0,
          maxValue: 10,
          axis: Axis.horizontal,
          step: 1,
          haptics: true,
          onChanged: (value) => setState(() => _currentIntValue = value),
        ),
        IconButton(
          icon: const Icon(Icons.add),
          onPressed: () => setState(() {
            _currentIntValue = (_currentIntValue + 1)
                .clamp(0, 10); // Clamp the value between 0 and 10
          }),
        ),
      ],
    );
  }
}
