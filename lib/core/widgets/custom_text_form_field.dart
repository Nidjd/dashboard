import 'package:flutter/material.dart';

class CustomTextFormFiled extends StatelessWidget {
  const CustomTextFormFiled({
    super.key,
    required this.controller,
    required this.label,
    this.sizee,
    this.option, this.keyboardType,
  });

  final TextEditingController controller;
  final String label;
  final double? sizee;
  final bool? option;
  final TextInputType? keyboardType;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      width: size.width * sizee!,
      child: TextFormField(
        keyboardType:keyboardType,
        controller: controller,
        decoration: InputDecoration(
            labelText: label,
            border: option == false
                ? const UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.grey,
                      width: 2.0,
                    ),
                  )
                : const OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.grey,
                      width: 2.0,
                    ),
                  ),
            filled: true,
            fillColor: Colors.white),
        validator: (value) {
          if (value!.isEmpty) {
            return 'يرجى إدخال $label';
          }
        },
      ),
    );
  }
}
