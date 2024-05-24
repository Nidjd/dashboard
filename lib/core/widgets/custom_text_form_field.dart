import 'package:flutter/material.dart';

class CustomTextFormFiled extends StatelessWidget {
  const CustomTextFormFiled({
    super.key,
    required this.controller,
    required this.label,
  });

  final TextEditingController controller;
  final String label;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
          labelText: label,
          border: OutlineInputBorder(
              borderSide: BorderSide(
            color: Colors.grey, // Set the color of the border
            width: 2.0, // Set the thickness of the border
          )),
          filled: true,
          fillColor: Colors.white),
      validator: (value) {
        if (value!.isEmpty) {
          return 'يرجى إدخال $label';
        }
        return null;
      },
    );
  }
}
