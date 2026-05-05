import 'dart:async';

import 'package:ecommerce_app/src/features/authentication/data/remote/authentication_remote_data_source.dart';
import 'package:ecommerce_app/src/exceptions/app_exception.dart';
import 'package:ecommerce_app/src/features/authentication/domain/fake_app_user.dart';

class FakeAuthenticationRemoteDataSource
    implements AuthenticationRemoteDataSource {
  final Map<String, String> _users = {'test@test.com': 'password'};
  FakeAppUser? _currentUser;
  final _authenticationState = StreamController<FakeAppUser?>.broadcast();

  @override
  Future<void> signUp({required String email, required String password}) async {
    await Future.delayed(const Duration(seconds: 1));
    if (_users.containsKey(email)) {
      throw EmailAlreadyInUseException();
    }
    _users[email] = password;
    _setCurrentUser(email: email, password: password);
  }

  @override
  Future<void> signIn({required String email, required String password}) async {
    await Future.delayed(const Duration(seconds: 1));
    final registeredPassword = _users[email];
    if (registeredPassword == null) {
      throw UserNotFoundException();
    }
    if (registeredPassword != password) {
      throw WrongPasswordException();
    }
    _setCurrentUser(email: email, password: password);
  }

  void _setCurrentUser({required String email, required String password}) {
    final user = FakeAppUser(
      uid: email.split('').reversed.join(),
      email: email,
      password: password,
    );
    _currentUser = user;
    _authenticationState.add(user);
  }

  @override
  FakeAppUser? get currentUser => _currentUser;

  @override
  Stream<FakeAppUser?> authenticationStateChanges() =>
      _authenticationState.stream;

  void dispose() {
    _authenticationState.close();
  }
}
