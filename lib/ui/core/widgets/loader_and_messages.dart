import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

mixin LoaderAndMessages<T extends ConsumerStatefulWidget> on ConsumerState<T> {
  var isOpen = false;

  void showLoader() {
    if (!isOpen) {
      isOpen = true;
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (_) => LoadingAnimationWidget.threeArchedCircle(
          color: Colors.white,
          size: 60,
        ),
      );
    }
  }

  void hideLoader() {
    if (isOpen) {
      isOpen = false;
      Navigator.of(context).pop();
    }
  }

  void _showSnackbar(String message, Color backgroundColor) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: backgroundColor,
      ),
    );
  }

  void showErrorSnackbar(String message) => _showSnackbar(message, Colors.red);

  void showSuccessSnackbar(String message) =>
      _showSnackbar(message, Colors.green);

  void showInfoSnackbar(String message) => _showSnackbar(message, Colors.blue);
}
