import 'package:cinebox/ui/core/themes/theme.dart';
import 'package:cinebox/ui/splash/splash_screen.dart';
import 'package:flutter/material.dart';

class CineboxMainApp extends StatelessWidget {
  const CineboxMainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cinebox',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.theme,
      routes: {
        '/': (_) => const SplashScreen(),
      },
    );
  }
}
