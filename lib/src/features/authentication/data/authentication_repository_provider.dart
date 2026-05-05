import 'package:ecommerce_app/src/features/authentication/data/authentication_repository.dart';
import 'package:ecommerce_app/src/features/authentication/data/remote/authentication_remote_data_source.dart';
import 'package:ecommerce_app/src/features/authentication/data/remote/fake_authentication_remote_data_source.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'authentication_repository_provider.g.dart';

@Riverpod(keepAlive: true)
AuthenticationRemoteDataSource authenticationRemoteDataSource(Ref ref) {
  return FakeAuthenticationRemoteDataSource();
}

@Riverpod(keepAlive: true)
AuthenticationRepository authenticationRepository(Ref ref) {
  final remoteDataSource = ref.watch(authenticationRemoteDataSourceProvider);
  return AuthenticationRepository(remoteDataSource: remoteDataSource);
}
