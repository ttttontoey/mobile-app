import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  const MyTextField({
    super.key,required this.controller, required this.labelText, required this.hintText, required this.obscureText, required Color textColor,
  });
  final controller;
  final String labelText;
  final String hintText;
  final bool obscureText;
  // final TextEditingController nameController;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      decoration: InputDecoration(
        label: Text(labelText),
        hintText: hintText,
        floatingLabelBehavior: FloatingLabelBehavior.always,
        contentPadding:
            const EdgeInsets.symmetric(vertical: 20, horizontal: 42),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: const BorderSide(color: Colors.grey),
          gapPadding: 10,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: const BorderSide(color: Colors.grey),
          gapPadding: 10,
        ),
      ),
    );
  }
}
