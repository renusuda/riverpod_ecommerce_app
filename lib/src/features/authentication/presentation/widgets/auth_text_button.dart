import 'package:flutter/material.dart';

class AuthTextButton extends StatelessWidget {
  const AuthTextButton({
    super.key,
    required this.label,
    required this.onPressed,
  });

  final String label;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Text(label, style: const TextStyle(color: Color(0xFF5C4DB1))),
    );
  }
}
