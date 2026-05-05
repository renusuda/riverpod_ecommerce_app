import 'package:flutter/material.dart';

class EmailTextField extends StatelessWidget {
  const EmailTextField({super.key, required this.controller});

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        hintText: 'メールアドレス',
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.grey.shade400),
        ),
      ),
    );
  }
}
