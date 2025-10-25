import 'dart:developer';

import 'package:cinebox/core/result/result.dart';
import 'package:cinebox/data/repositories/repositories_providers.dart';
import 'package:cinebox/domain/models/favorite_movie.dart';
import 'package:cinebox/ui/core/commands/favorite_movie_command.dart';
import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'save_favorite_movie_command.g.dart';

@riverpod
class SaveFavoriteMovieCommand extends _$SaveFavoriteMovieCommand {
  @override
  AsyncValue<int> build({required Key key, required int id}) {
    return AsyncValue.data(id);
  }

  Future<void> execute({
    required int id,
    required String title,
    required String posterPath,
    required int year,
  }) async {
    final favoriteMovieCommand = ref.read(
      favoriteMovieCommandProvider(id: id).notifier,
    )..setFavorite(true);

    final repo = ref.read(moviesRepositoryProvider);
    final result = await repo.saveFavoriteMovie(
      FavoriteMovie(
        id: id,
        title: title,
        posterPath: posterPath,
        year: year,
      ),
    );

    switch (result) {
      case Success():
        log('Filme salvo nos favoritos com sucesso');
      case Failure(:final error):
        state = AsyncValue.error(error, StackTrace.current);
        favoriteMovieCommand.setFavorite(false);
    }
  }
}
