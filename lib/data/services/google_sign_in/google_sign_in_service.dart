import 'dart:developer';

import 'package:cinebox/core/result/result.dart';
import 'package:google_sign_in/google_sign_in.dart';

abstract interface class GoogleSignInService {
  Future<Result<String>> signIn();
  Future<Result<Unit>> signOut();
  Future<Result<String>> isSignedIn();
}

class GoogleSignInServiceImpl implements GoogleSignInService {
  @override
  Future<Result<String>> signIn() async {
    try {
      final auth = await GoogleSignIn.instance.authenticate(
        scopeHint: ['email', 'profile', 'openid'],
      );

      if (auth.authentication case GoogleSignInAuthentication(
        idToken: final idToken?,
      )) {
        return Success(value: idToken);
      }
      return Failure(error: Exception('Falha ao realizar login com Google'));
    } catch (e, s) {
      log(
        'Erro ao realizar login com Google',
        name: 'GoogleSignInService',
        error: e,
        stackTrace: s,
      );
      return Failure(error: Exception('Falha ao realizar login com Google'));
    }
  }

  @override
  Future<Result<String>> isSignedIn() async {
    try {
      final logged = await GoogleSignIn.instance
          .attemptLightweightAuthentication();
      if (logged case GoogleSignInAccount(
        authentication: GoogleSignInAuthentication(idToken: final idToken?),
      )) {
        return Success(value: idToken);
      }
      return Failure(error: Exception('Usuário não está logado no Google'));
    } catch (e, s) {
      log(
        'Erro ao verificar status de login com Google',
        name: 'GoogleSignInService',
        error: e,
        stackTrace: s,
      );
      return Failure(
        error: Exception('Falha ao verificar status de login com Google'),
      );
    }
  }

  @override
  Future<Result<Unit>> signOut() async {
    try {
      await GoogleSignIn.instance.signOut();
      return successOfUnit();
    } catch (e, s) {
      log(
        'Erro ao realizar logout com Google',
        name: 'GoogleSignInService',
        error: e,
        stackTrace: s,
      );
      return Failure(error: Exception('Falha ao realizar logout com Google'));
    }
  }
}
