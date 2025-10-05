import 'package:cinebox/ui/core/themes/resource.dart';
import 'package:cinebox/ui/core/widgets/loader_messages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SplashScreen extends ConsumerStatefulWidget {
  const SplashScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _State();
}

class _State extends ConsumerState<SplashScreen> with LoaderMessages {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset(
          R.ASSETS_IMAGES_BG_LOGIN_PNG,
          fit: BoxFit.fill,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // showLoader();
          // Future.delayed(const Duration(seconds: 3), () {
          //   hideLoader();
          //   showErrorSnackbar("An error occurred");
          // });
        },
        child: const Icon(Icons.play_arrow),
      ),
    );
  }
}
