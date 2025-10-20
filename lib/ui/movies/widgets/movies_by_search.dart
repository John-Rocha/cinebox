import 'package:cinebox/ui/movies/commands/search_movies_by_name.dart';
import 'package:cinebox/ui/movies/widgets/movies_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MoviesBySearch extends ConsumerStatefulWidget {
  const MoviesBySearch({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _MoviesBySearchState();
}

class _MoviesBySearchState extends ConsumerState<MoviesBySearch> {
  @override
  Widget build(BuildContext context) {
    final moviesResult = ref.watch(searchMoviesByNameProvider);
    return moviesResult.when(
      data: (data) {
        return Container(
          margin: EdgeInsets.only(bottom: 130),
          child: MoviesBox(
            title: 'Filmes Encontrados pela busca',
            movies: data,
            vertical: true,
          ),
        );
      },
      error: (error, stackTrace) {
        return Center(
          child: Text(
            'Erro ao buscar filmes',
          ),
        );
      },
      loading: () {
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
