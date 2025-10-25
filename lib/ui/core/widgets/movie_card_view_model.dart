import 'package:cinebox/ui/core/commands/save_favorite_movie_command.dart';
import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'movie_card_view_model.g.dart';

@riverpod
class MovieCardViewModel extends _$MovieCardViewModel {
  @override
  void build({required Key key, required int id}) {}

  void addOrRemoveFavorite({
    required int id,
    required String title,
    required String posterPath,
    required int year,
    required bool isFavorite,
  }) {
    if (isFavorite) {
      ref
          .read(saveFavoriteMovieCommandProvider(key: key, id: id).notifier)
          .execute(
            id: id,
            title: title,
            posterPath: posterPath,
            year: year,
          );
    } else {}
  }
}
