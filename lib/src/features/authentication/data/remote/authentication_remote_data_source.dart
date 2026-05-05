import 'package:ecommerce_app/src/features/authentication/domain/app_user.dart';

abstract interface class AuthenticationRemoteDataSource {
  Future<void> signUp({required String email, required String password});

  Future<void> signIn({required String email, required String password});

  Future<void> signOut();

  AppUser? get currentUser;

  Stream<AppUser?> authenticationStateChanges();
}
