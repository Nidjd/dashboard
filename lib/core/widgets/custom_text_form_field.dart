import 'package:flutter/material.dart';

class CustomTextFormFiled extends StatelessWidget {
  const CustomTextFormFiled({
    super.key,
    required this.controller, required this.label,
  });

  final TextEditingController controller;
  final String label;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        labelText: label,
        border: const OutlineInputBorder(),
        filled: true,
        fillColor: Colors.teal[50],
      ),
      validator: (value) {
        if (value!.isEmpty) {
          return 'يرجى إدخال $label';
        }
        return null;
      },
    );
  }
}
