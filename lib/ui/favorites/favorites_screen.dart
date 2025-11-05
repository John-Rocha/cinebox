import 'package:cinebox/ui/core/widgets/loader_and_messages.dart';
import 'package:cinebox/ui/core/widgets/movie_card.dart';
import 'package:cinebox/ui/favorites/commands/get_favorite_command.dart';
import 'package:cinebox/ui/favorites/favorites_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FavoritesScreen extends ConsumerStatefulWidget {
  const FavoritesScreen({super.key});

  @override
  ConsumerState<FavoritesScreen> createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends ConsumerState<FavoritesScreen>
    with LoaderAndMessages {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(favoritesViewModelProvider).fetchFavorites();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final favoritesMovies = ref.watch(getFavoriteCommandProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Meus favoritos'),
        automaticallyImplyLeading: false,
      ),
      body: favoritesMovies.when(
        data: (movies) {
          if (movies.isEmpty) {
            return const Center(
              child: Text('Nenhum filme favorito encontrado.'),
            );
          }
          return CustomScrollView(
            slivers: [
              SliverPadding(
                padding: EdgeInsetsGeometry.symmetric(horizontal: 16),
                sliver: SliverGrid(
                  gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 148,
                    mainAxisExtent: 268,
                  ),
                  delegate: SliverChildBuilderDelegate(
                    childCount: movies.length,
                    (context, index) {
                      final movie = movies[index];
                      return Container(
                        margin: EdgeInsets.all(8),
                        child: MovieCard(
                          key: UniqueKey(),
                          id: movie.id,
                          title: movie.title,
                          year: movie.year,
                          imageUrl: movie.posterPath,
                          isFavorite: true,
                          onFavoriteTap: () async {
                            showLoader();
                            await ref
                                .read(favoritesViewModelProvider)
                                .deleteFavoriteMovie(movieId: movie.id);
                            hideLoader();
                          },
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stack) => Center(
          child: Text('Erro ao carregar favoritos'),
        ),
      ),
    );
  }
}
