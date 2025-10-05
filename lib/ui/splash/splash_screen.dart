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
      body: Stack(
        children: [
          Image.asset(
            R.ASSETS_IMAGES_BG_LOGIN_PNG,
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.cover,
          ),
          Container(
            color: Colors.black.withAlpha(170),
            constraints: BoxConstraints.expand(),
          ),
          Center(
            child: Image.asset(
              R.ASSETS_IMAGES_LOGO_PNG,
            ),
          ),
        ],
      ),
    );
  }
}
