import 'dart:developer';

import 'package:cinebox/core/result/result.dart';
import 'package:cinebox/data/exceptions/data_exceptions.dart';
import 'package:cinebox/data/services/movies/movies_service.dart';
import 'package:cinebox/domain/models/favorite_movie.dart';
import 'package:dio/dio.dart';

abstract interface class MoviesRepository {
  Future<Result<List<FavoriteMovie>>> getMyFavoritesMovies();
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
}
