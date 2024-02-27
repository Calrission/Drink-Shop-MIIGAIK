import 'package:flutter/material.dart';

class Button extends StatefulWidget {

  final String text;
  final Function()? onPressed;
  final bool isEnable;

  const Button({super.key, required this.text, this.onPressed, required this.isEnable});

  @override
  State<Button> createState() => _ButtonState();
}

class _ButtonState extends State<Button> {

  @override
  Widget build(BuildContext context) {
    return FilledButton(
      onPressed: (widget.isEnable) ? (){
        if (widget.onPressed != null) {
          widget.onPressed!();
        }
      } : null,
      child: Text(widget.text)
    );
  }
}