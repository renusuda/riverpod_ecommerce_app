import 'package:ecommerce_app/src/features/authentication/data/authentication_repository_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'sign_in_provider.g.dart';

@riverpod
class SignIn extends _$SignIn {
  @override
  FutureOr<void> build() {}

  Future<void> signIn({required String email, required String password}) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(
      () => ref
          .read(authenticationRepositoryProvider)
          .signIn(email: email, password: password),
    );
  }
}
