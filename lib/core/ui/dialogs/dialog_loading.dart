import 'package:flutter/material.dart';

class LoadingDialog extends StatelessWidget {

  static final GlobalKey _dialogKey = GlobalKey();

  const LoadingDialog({super.key});


  static void show(BuildContext context) {
    if (_dialogKey.currentContext != null || !context.mounted){
      return;
    }
    showDialog(
      context: context,
      builder: (_) => const LoadingDialog(),
      barrierDismissible: false
    );
  }

  static void hide(BuildContext context){
    if (_dialogKey.currentContext != null && context.mounted) {
      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Dialog(
        key: _dialogKey,
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