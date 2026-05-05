import 'package:flutter/material.dart';

class PasswordTextField extends StatelessWidget {
  const PasswordTextField({
    super.key,
    required this.hintText,
    required this.controller,
  });

  final String hintText;

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      obscureText: true,
      decoration: InputDecoration(
        hintText: hintText,
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.grey.shade400),
        ),
      ),
    );
  }
}
