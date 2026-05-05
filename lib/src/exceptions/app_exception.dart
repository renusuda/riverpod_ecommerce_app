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

class UserNotFoundException extends AppException {
  UserNotFoundException() : super('user-not-found', 'ユーザーが見つかりません。');
}

class WrongPasswordException extends AppException {
  WrongPasswordException() : super('wrong-password', 'パスワードが正しくありません。');
}
