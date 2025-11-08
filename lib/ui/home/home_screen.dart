import 'package:cinebox/ui/favorites/favorites_screen.dart';
import 'package:cinebox/ui/home/widget/home_bottom_nav_bar.dart';
import 'package:cinebox/ui/movies/movies_screen.dart';
import 'package:cinebox/ui/profile/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: AnimatedSwitcher(
        duration: const Duration(milliseconds: 300),
        transitionBuilder: (child, animation) {
          return FadeTransition(
            opacity: animation,
            child: child,
          );
        },
        child: switch (_currentIndex) {
          0 => const MoviesScreen(key: ValueKey(0)),
          1 => FavoritesScreen(key: ValueKey(1)),
          2 => const ProfileScreen(
            key: ValueKey(2),
          ),
          _ => const MoviesScreen(key: ValueKey(0)),
        },
      ),
      bottomNavigationBar: HomeBottomNavBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}
