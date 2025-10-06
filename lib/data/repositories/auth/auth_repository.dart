import 'dart:developer';

import 'package:cinebox/core/result/result.dart';
import 'package:cinebox/data/exceptions/data_exceptions.dart';
import 'package:cinebox/data/services/auth/auth_service.dart';
import 'package:cinebox/data/services/google_sign_in/google_sign_in_service.dart';
import 'package:cinebox/data/services/local_storage/local_storage_service.dart';
import 'package:dio/dio.dart';

abstract interface class AuthRepository {
  Future<Result<Unit>> signIn();
  Future<Result<Unit>> signOut();
  Future<Result<bool>> isLogged();
}

class AuthRepositoryImpl implements AuthRepository {
  final LocalStorageService _localStorageService;
  final GoogleSignInService _googleSignInService;
  final AuthService _authService;

  AuthRepositoryImpl({
    required LocalStorageService localStorageService,
    required GoogleSignInService googleSignInService,
    required AuthService authService,
  }) : _localStorageService = localStorageService,
       _googleSignInService = googleSignInService,
       _authService = authService;

  @override
  Future<Result<Unit>> signIn() async {
    final result = await _googleSignInService.signIn();
    switch (result) {
      case Success<String>(:final value):
        try {
          await _localStorageService.saveIdToken(idToken: value);
          await _authService.auth();
          return successOfUnit();
        } on DioException catch (e, s) {
          log(
            'Erro ao realizar login',
            name: 'AuthRepository',
            error: e,
            stackTrace: s,
          );
          return Failure(
            error: DataExceptions(
              message: 'Falha ao realizar login com Google',
            ),
          );
        }
      case Failure<String>(:final error):
        log(
          'Erro ao realizar login',
          name: 'AuthRepository',
          error: error,
        );
        return Failure(
          error: DataExceptions(message: 'Falha ao realizar login com Google'),
        );
    }
  }

  @override
  Future<Result<bool>> isLogged() async {
    final resultToken = await _localStorageService.getIdToken();
    return switch (resultToken) {
      Success<String>() => Success(value: true),
      Failure<String>() => Success(value: false),
    };
  }

  @override
  Future<Result<Unit>> signOut() async {
    final result = await _googleSignInService.signOut();
    switch (result) {
      case Success<Unit>():
        final removeResult = await _localStorageService.removeIdToken();
        return switch (removeResult) {
          Success<Unit>() => successOfUnit(),

          Failure<Unit>(:final error) => Failure(error: error),
        };
      case Failure<Unit>(:final error):
        log(
          'Erro ao realizar logout',
          name: 'AuthRepository',
          error: error,
        );
        return Failure(error: error);
    }
  }
}
