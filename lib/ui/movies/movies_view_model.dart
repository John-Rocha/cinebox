import 'package:cinebox/ui/movies/commands/get_movies_by_category_command.dart';
import 'package:cinebox/ui/movies/commands/get_movies_by_genre_command.dart';
import 'package:cinebox/ui/movies/commands/search_movies_by_name.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'movies_view_model.g.dart';

enum MoviesViewEnum { byCategory, byGenre, bySearch }

@riverpod
class MoviesViewModel extends _$MoviesViewModel {
  @override
  MoviesViewEnum build() => MoviesViewEnum.byCategory;

  Future<void> changeView({required MoviesViewEnum view}) async {
    state = view;
    await Future.delayed(Duration(milliseconds: 200));
  }

  Future<void> fetchMoviesByCategory() async {
    await changeView(view: MoviesViewEnum.byCategory);
    ref.read(getMoviesByCategoryCommandProvider.notifier).execute();
  }

  Future<void> fetchMoviesByGenre({required int genreId}) async {
    await changeView(view: MoviesViewEnum.byGenre);
    ref
        .read(getMoviesByGenreCommandProvider.notifier)
        .execute(genreId: genreId);
  }

  Future<void> fetchMoviesBySearch({required String query}) async {
    await changeView(view: MoviesViewEnum.bySearch);
    ref.read(searchMoviesByNameProvider.notifier).execute(query: query);
  }
}
