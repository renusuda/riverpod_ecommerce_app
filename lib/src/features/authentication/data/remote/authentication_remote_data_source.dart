import 'package:ecommerce_app/src/features/authentication/domain/app_user.dart';

abstract interface class AuthenticationRemoteDataSource {
  Future<AppUser> signUp({required String email, required String password});

  Future<AppUser> signIn({required String email, required String password});

  AppUser? get currentUser;

  Stream<AppUser?> authenticationStateChanges();
}
