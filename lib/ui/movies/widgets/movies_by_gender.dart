import 'package:cinebox/ui/movies/widgets/commands/get_movies_by_genre_command.dart';
import 'package:cinebox/ui/movies/widgets/movies_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MoviesByGender extends ConsumerWidget {
  const MoviesByGender({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final moviesByGenre = ref.watch(getMoviesByGenreCommandProvider);

    return moviesByGenre.when(
      loading: () {
        return Center(
          child: CircularProgressIndicator(),
        );
      },
      error: (error, stackTrace) {
        return Center(
          child: Text('Erro ao carregar filmes por gênero'),
        );
      },
      data: (data) {
        return Container(
          margin: EdgeInsets.only(bottom: 130),
          child: MoviesBox(
            title: 'Filmes Encontrados',
            movies: data,
            vertical: true,
          ),
        );
      },
    );
  }
}
