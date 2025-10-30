import 'dart:developer';

import 'package:cinebox/core/result/result.dart';
import 'package:cinebox/data/exceptions/data_exceptions.dart';
import 'package:cinebox/data/models/save_favorite_movie.dart';
import 'package:cinebox/data/services/movies/movies_service.dart';
import 'package:cinebox/domain/models/favorite_movie.dart';
import 'package:dio/dio.dart';

abstract interface class MoviesRepository {
  Future<Result<List<FavoriteMovie>>> getMyFavoritesMovies();
  Future<Result<Unit>> deleteFavoriteMovie({required int id});
  Future<Result<Unit>> saveFavoriteMovie(FavoriteMovie favoriteMovie);
}

class MoviesRepositoryImpl implements MoviesRepository {
  final MoviesService _moviesService;

  MoviesRepositoryImpl({required MoviesService moviesService})
    : _moviesService = moviesService;

  @override
  Future<Result<List<FavoriteMovie>>> getMyFavoritesMovies() async {
    try {
      final response = await _moviesService.getMyFavoriteMovies();
      final favoriteMovies = response
          .map(
            (movieResponse) => FavoriteMovie(
              id: movieResponse.movieId,
              title: movieResponse.title,
              posterPath: movieResponse.posterUrl,
              year: movieResponse.year,
            ),
          )
          .toList();
      return Success(value: favoriteMovies);
    } on DioException catch (e, s) {
      log('Erro ao buscar os filmes favoritos', error: e, stackTrace: s);
      return Failure(
        error: DataExceptions(message: 'Erro ao buscar os filmes favoritos'),
      );
    }
  }

  @override
  Future<Result<Unit>> saveFavoriteMovie(FavoriteMovie favoriteMovie) async {
    try {
      await _moviesService.saveFavoriteMovie(
        SaveFavoriteMovie(
          movieId: favoriteMovie.id,
          posterUrl: favoriteMovie.posterPath,
          title: favoriteMovie.title,
          year: favoriteMovie.year,
        ),
      );
      return successOfUnit();
    } on DioException catch (e, s) {
      log('Erro ao salvar o filme no favorito', error: e, stackTrace: s);
      return Failure(
        error: DataExceptions(message: 'Erro ao salvar o filme no favorito'),
      );
    }
  }

  @override
  Future<Result<Unit>> deleteFavoriteMovie({required int id}) async {
    try {
      await _moviesService.deleteFavoriteMovie(id: id);
      return successOfUnit();
    } on DioException catch (e, s) {
      log('Erro ao remover o filme do favorito', error: e, stackTrace: s);
      return Failure(
        error: DataExceptions(message: 'Erro ao remover o filme do favorito'),
      );
    }
  }
}
