sealed class AppException implements Exception {
  AppException(this.code, this.message);
  final String code;
  final String message;

  @override
  String toString() => message;
}

class EmailAlreadyInUseException extends AppException {
  EmailAlreadyInUseException()
    : super('email-already-in-use', 'このメールアドレスはすでに使用されています。');
}
