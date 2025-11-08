import 'package:cached_network_image/cached_network_image.dart';
import 'package:cinebox/ui/core/themes/colors.dart';
import 'package:cinebox/ui/core/themes/text_styles.dart';
import 'package:cinebox/ui/core/widgets/loader_and_messages.dart';
import 'package:cinebox/ui/movie_detail/commands/get_movie_details_command.dart';
import 'package:cinebox/ui/movie_detail/movie_detail_view_model.dart';
import 'package:cinebox/ui/movie_detail/widgets/cast_box.dart';
import 'package:cinebox/ui/movie_detail/widgets/movie_trailer.dart';
import 'package:cinebox/ui/movie_detail/widgets/rating_panel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_stars/flutter_rating_stars.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MovieDetailScreen extends ConsumerStatefulWidget {
  const MovieDetailScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _MovieDetailScreenState();
}

class _MovieDetailScreenState extends ConsumerState<MovieDetailScreen>
    with LoaderAndMessages {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final movieId = ModalRoute.of(context)?.settings.arguments as int?;
      if (movieId == null) {
        showErrorSnackbar('ID do filme não encontrado.');
        Navigator.of(context).pop();
        return;
      }
      ref
          .read(movieDetailViewModelProvider)
          .fetchMovieDetails(movieId: movieId);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final movieDetail = ref.watch(getMovieDetailsCommandProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Detalhes do Filme'),
      ),
      body: movieDetail.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stackTrace) => Center(
          child: Text('Erro ao carregar detalhes do filme'),
        ),
        data: (movieDetail) {
          if (movieDetail == null) {
            return Center(
              child: Text('Detalhes do filme não encontrados'),
            );
          }

          final hoursRuntime = movieDetail.runtime ~/ 60;
          final minutesRuntime = movieDetail.runtime % 60;

          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 24,
              children: [
                SizedBox(
                  height: 280,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: movieDetail.images.length,
                    itemBuilder: (context, index) {
                      final imageUrl = movieDetail.images[index];
                      return Padding(
                        padding: const EdgeInsets.all(2),
                        child: CachedNetworkImage(
                          fit: BoxFit.cover,
                          imageUrl: imageUrl,
                          placeholder: (context, url) {
                            return Container(
                              width: 160,
                              color: AppColors.lightGrey,
                              child: const Center(
                                child: CircularProgressIndicator(),
                              ),
                            );
                          },
                          errorWidget: (context, url, error) => Icon(
                            Icons.error,
                            color: AppColors.redColor,
                          ),
                        ),
                      );
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    spacing: 8,
                    children: [
                      Text(
                        movieDetail.title,
                        style: AppTextStyles.titleLarge,
                      ),
                      RatingStars(
                        starCount: 5,
                        starColor: AppColors.yellow,
                        starSize: 16,
                        valueLabelVisibility: false,
                        value: movieDetail.voteAverage / 2,
                      ),
                      Text(
                        movieDetail.genres
                            .map((genre) => genre.name)
                            .join(', '),
                        style: AppTextStyles.lightGreyRegular,
                      ),
                      Text(
                        '${DateTime.parse(movieDetail.releaseDate).year} | ${hoursRuntime}h ${minutesRuntime}m',
                        style: AppTextStyles.regularSmall,
                      ),
                      Text(
                        movieDetail.overview,
                        style: AppTextStyles.regularSmall,
                      ),
                      CastBox(movieDetail: movieDetail),
                      if (movieDetail.videos.isNotEmpty)
                        MovieTrailer(videoId: movieDetail.videos.first),
                      const SizedBox(height: 30),
                      RatingPanel(
                        voteAverage: movieDetail.voteAverage,
                        voteCount: movieDetail.voteCount,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
