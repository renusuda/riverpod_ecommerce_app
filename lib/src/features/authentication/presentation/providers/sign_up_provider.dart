import 'package:ecommerce_app/src/features/authentication/data/authentication_repository_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'sign_up_provider.g.dart';

@riverpod
class SignUp extends _$SignUp {
  @override
  FutureOr<void> build() {}

  Future<void> signUp({required String email, required String password}) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(
      () => ref
          .read(authenticationRepositoryProvider)
          .signUp(email: email, password: password),
    );
  }
}
