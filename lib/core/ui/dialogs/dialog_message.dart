import 'package:drink_shop/core/values/strings.dart';
import 'package:flutter/material.dart';

class MessageDialog extends StatelessWidget {

  final String title;
  final String message;


  const MessageDialog(
    {
      super.key,
      required this.title,
      required this.message
    }
  );

  const MessageDialog.error(
    {
      super.key,
      required String error
    }
  ): title=textError, message=error;

  static void show(BuildContext context, String title, String message){
    showDialog(
      context: context,
      builder: (_) => MessageDialog(
        title: title,
        message: message,
      ),
      barrierDismissible: false
    );
  }

  static void showError(BuildContext context, String message){
    showDialog(
      context: context,
      builder: (_) => MessageDialog.error(
        error: message,
      ),
      barrierDismissible: false
    );
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(title),
      content: Text(message),
      actions: [
        TextButton(
          onPressed: (){
            Navigator.pop(context);
          },
          child: const Text(textOK)
        )
      ],
    );
  }
}