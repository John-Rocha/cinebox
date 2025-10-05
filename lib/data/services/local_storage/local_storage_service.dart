import 'package:cinebox/core/result/result.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

abstract interface class LocalStorageService {
  Future<Result<Unit>> saveIdToken({required String idToken});
  Future<Result<String>> getIdToken();
  Future<Result<Unit>> removeIdToken();
}

class LocalStorageServiceImpl implements LocalStorageService {
  final FlutterSecureStorage _flutterSecureStorage;

  LocalStorageServiceImpl({required FlutterSecureStorage flutterSecureStorage})
    : _flutterSecureStorage = flutterSecureStorage;

  @override
  Future<Result<String>> getIdToken() async {
    final idToken = await _flutterSecureStorage.read(key: 'idToken');
    if (idToken == null) {
      return Failure(error: Exception('Nenhum idToken encontrado'));
    }
    return Success(value: idToken);
  }

  @override
  Future<Result<Unit>> removeIdToken() async {
    await _flutterSecureStorage.delete(key: 'idToken');
    return successOfUnit();
  }

  @override
  Future<Result<Unit>> saveIdToken({required String idToken}) async {
    await _flutterSecureStorage.write(key: 'idToken', value: idToken);
    return successOfUnit();
  }
}
