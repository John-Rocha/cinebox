import 'package:cinebox/data/core/rest_client/backend_rest_client_provider.dart';
import 'package:cinebox/data/services/auth/auth_service.dart';
import 'package:cinebox/data/services/google_sign_in/google_sign_in_service.dart';
import 'package:cinebox/data/services/local_storage/local_storage_service.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'services_providers.g.dart';

@riverpod
GoogleSignInService googleSignInService(Ref ref) {
  return GoogleSignInServiceImpl();
}

@Riverpod(keepAlive: true)
LocalStorageService localStorageService(Ref ref) {
  return LocalStorageServiceImpl(
    flutterSecureStorage: const FlutterSecureStorage(),
  );
}

@riverpod
AuthService authService(Ref ref) {
  final dio = ref.read(backendRestClientProvider);
  return AuthService(dio);
}
