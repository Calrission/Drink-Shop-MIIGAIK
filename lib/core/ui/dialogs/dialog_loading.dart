import 'package:flutter/material.dart';

class LoadingDialog extends StatelessWidget {
  const LoadingDialog({super.key});

  static void show(BuildContext context) {
    showDialog(
      context: context,
      builder: (_) => const LoadingDialog(),
      barrierDismissible: false
    );
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Dialog(
        surfaceTintColor: Colors.transparent,
        backgroundColor: Colors.transparent,
        child: Center(
          child: Transform.scale(
            scale: 1.5,
            child: const CircularProgressIndicator()
          ),
        ),
      ),
    );
  }
}