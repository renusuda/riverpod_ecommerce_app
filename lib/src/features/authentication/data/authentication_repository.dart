import 'package:ecommerce_app/src/features/authentication/data/remote/authentication_remote_data_source.dart';
import 'package:ecommerce_app/src/features/authentication/domain/app_user.dart';

class AuthenticationRepository {
  const AuthenticationRepository({
    required AuthenticationRemoteDataSource remoteDataSource,
  }) : _remoteDataSource = remoteDataSource;

  final AuthenticationRemoteDataSource _remoteDataSource;

  Future<AppUser> signUp({required String email, required String password}) {
    return _remoteDataSource.signUp(email: email, password: password);
  }

  AppUser? get currentUser => _remoteDataSource.currentUser;

  Stream<AppUser?> authenticationStateChanges() {
    return _remoteDataSource.authenticationStateChanges();
  }
}
