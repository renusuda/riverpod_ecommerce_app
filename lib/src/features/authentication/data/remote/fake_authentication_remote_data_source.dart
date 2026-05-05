import 'dart:async';

import 'package:ecommerce_app/src/features/authentication/data/remote/authentication_remote_data_source.dart';
import 'package:ecommerce_app/src/exceptions/app_exception.dart';
import 'package:ecommerce_app/src/features/authentication/domain/fake_app_user.dart';

class FakeAuthenticationRemoteDataSource
    implements AuthenticationRemoteDataSource {
  final Map<String, String> _users = {};
  FakeAppUser? _currentUser;
  final _authenticationState = StreamController<FakeAppUser?>.broadcast();

  @override
  Future<FakeAppUser> signUp({
    required String email,
    required String password,
  }) async {
    if (_users.containsKey(email)) {
      throw EmailAlreadyInUseException();
    }
    _users[email] = password;
    final user = FakeAppUser(
      uid: email.split('').reversed.join(),
      email: email,
      password: password,
    );
    _currentUser = user;
    _authenticationState.add(user);
    return user;
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
