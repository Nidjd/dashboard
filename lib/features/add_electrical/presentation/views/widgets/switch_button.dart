import 'package:flutter/material.dart';

class SwitchButton extends StatefulWidget {
  const SwitchButton({super.key});

  @override
  State<SwitchButton> createState() => _SwitchButtonState();
}

class _SwitchButtonState extends State<SwitchButton> {
   bool _isSwitchOn = false;
  @override
  Widget build(BuildContext context) {
    return  Switch(
                  value: _isSwitchOn,
                  onChanged: (bool newValue) {
                    setState(() {
                      _isSwitchOn = newValue;
                    });
                  },
                  activeColor: Colors.green,
                  inactiveThumbColor: Colors.grey,
                  inactiveTrackColor: Colors.grey.withOpacity(0.5),
                );
  }
}