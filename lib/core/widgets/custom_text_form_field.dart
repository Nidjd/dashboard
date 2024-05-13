
import 'package:flutter/material.dart';

class CustomTextFormFiled extends StatelessWidget {
  const CustomTextFormFiled({
    super.key,
    required this.nameWorker,
  });

  final TextEditingController nameWorker;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: nameWorker,
      style: const TextStyle(
        color: Colors.black,
      ),
      decoration: InputDecoration(
        fillColor: Colors.white,
        hintText: "Enter name's worker",
        hintStyle: TextStyle(
          color: Colors.grey[400],
        ),
        filled: true,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(
            8,
          ),
        ),
      ),
    );
  }
}
