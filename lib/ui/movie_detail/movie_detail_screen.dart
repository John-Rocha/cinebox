import 'package:cached_network_image/cached_network_image.dart';
import 'package:cinebox/ui/core/themes/colors.dart';
import 'package:cinebox/ui/core/themes/text_styles.dart';
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

class _MovieDetailScreenState extends ConsumerState<MovieDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detalhes do Filme'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 24,
          children: [
            SizedBox(
              height: 280,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 10,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(2),
                    child: CachedNetworkImage(
                      imageUrl:
                          'https://heroisdatv.com.br/wp-content/uploads/2025/07/Quem-sao-os-Hashiras-de-Demon-Slayer.jpg',
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
                    'Título do Filme',
                    style: AppTextStyles.titleLarge,
                  ),
                  RatingStars(
                    starCount: 5,
                    starColor: AppColors.yellow,
                    starSize: 16,
                    valueLabelVisibility: false,
                    value: 2.5,
                  ),
                  Text(
                    'Animação, Comédia, Família, Fantasia',
                    style: AppTextStyles.lightGreyRegular,
                  ),
                  Text(
                    '2025 (USA) | 1h 45min | Livre',
                    style: AppTextStyles.regularSmall,
                  ),
                  Text(
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.',
                    style: AppTextStyles.regularSmall,
                  ),
                  CastBox(),
                  MovieTrailer(),
                  const SizedBox(height: 30),
                  RatingPanel(
                    voteAverage: 20,
                    voteCount: 20,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
