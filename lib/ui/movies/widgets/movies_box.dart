import 'package:cinebox/domain/models/movie.dart';
import 'package:cinebox/ui/core/widgets/movie_card.dart';
import 'package:flutter/material.dart';

class MoviesBox extends StatelessWidget {
  const MoviesBox({
    required this.title,
    required this.movies,
    super.key,
    this.vertical = false,
  });

  final String title;
  final bool vertical;
  final List<Movie> movies;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(
            left: 20,
            top: 32,
            bottom: 24,
          ),
          child: Text(
            title,
            textAlign: TextAlign.start,
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        Visibility(
          visible: !vertical,
          replacement: Center(
            child: Wrap(
              spacing: 20,
              runSpacing: 20,
              runAlignment: WrapAlignment.center,
              children: movies
                  .map(
                    (movie) => MovieCard(
                      id: movie.id,
                      title: movie.title,
                      year:
                          movie.releaseDate != null &&
                              movie.releaseDate!.isNotEmpty
                          ? DateTime.parse(movie.releaseDate!).year
                          : DateTime.now().year,
                      imageUrl:
                          'https://images.tmdb.org/t/p/w154${movie.posterPath}',
                    ),
                  )
                  .toList(),
            ),
          ),
          child: SizedBox(
            width: MediaQuery.sizeOf(context).width,
            height: 252,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              physics: BouncingScrollPhysics(),
              padding: EdgeInsets.only(left: 20),
              itemCount: movies.length,
              itemBuilder: (context, index) {
                final movie = movies[index];
                return Container(
                  margin: EdgeInsets.only(right: 16),
                  child: MovieCard(
                    key: UniqueKey(),
                    id: movie.id,
                    title: movie.title,
                    year:
                        movie.releaseDate != null &&
                            movie.releaseDate!.isNotEmpty
                        ? DateTime.parse(movie.releaseDate!).year
                        : DateTime.now().year,
                    imageUrl:
                        'https://images.tmdb.org/t/p/w154${movie.posterPath}',
                    isFavorite: movie.isFavorite,
                  ),
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
