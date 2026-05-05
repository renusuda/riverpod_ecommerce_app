String? validateEmail(String? value) {
  if (value == null || value.trim().isEmpty) {
    return 'メールアドレスを入力してください';
  }
  if (!RegExp(r'^[^@\s]+@[^@\s]+\.[^@\s]+$').hasMatch(value)) {
    return '正しいメールアドレスを入力してください';
  }
  return null;
}

String? validatePasswordNotEmpty(String? value) {
  if (value == null || value.trim().isEmpty) {
    return 'パスワードを入力してください';
  }
  return null;
}
