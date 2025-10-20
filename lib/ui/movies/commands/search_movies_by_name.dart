import 'package:cinebox/core/result/result.dart';
import 'package:cinebox/domain/models/movie.dart';
import 'package:cinebox/domain/usecases/usecases_providers.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'search_movies_by_name.g.dart';

@riverpod
class SearchMoviesByName extends _$SearchMoviesByName {
  @override
  AsyncValue<List<Movie>> build() => const AsyncLoading();

  Future<void> execute({required String query}) async {
    state = const AsyncLoading();
    final searchMoviesUC = ref.read(getMoviesByNameUsecaseProvider);
    final result = await searchMoviesUC.execute(name: query);
    state = switch (result) {
      Success(value: final movies) => AsyncData(movies),
      Failure() => AsyncError('Erro ao buscar filmes', StackTrace.current),
    };
  }
}
