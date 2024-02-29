import 'dart:async';

import 'package:drink_shop/core/ui/theme/state_with_library.dart';
import 'package:drink_shop/core/utils/extensions.dart';
import 'package:drink_shop/core/values/strings.dart';
import 'package:flutter/material.dart';

class TextCountDownTimerController {

  int seconds = 60;
  bool isLaunch = false;

  TextCountDownTimerController(this.seconds);

  void decreaseSeconds() {
    seconds--;
  }

  void resetSeconds() {
    seconds = 60;
  }
}

class TextCountDownTimer extends StatefulWidget {
  final Function tapOnFinish;
  final TextCountDownTimerController controller;

  const TextCountDownTimer(
    {
      super.key,
      required this.tapOnFinish,
      required this.controller
    }
  );

  @override
  StateWithLibrary<TextCountDownTimer> createState() =>
      _TextCountDownTimerState();
}

class _TextCountDownTimerState extends StateWithLibrary<TextCountDownTimer> {

  late final TextCountDownTimerController controller;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    controller = widget.controller;
    setState(() {
      delayedSecond();
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void delayedSecond() {
    _timer = Timer(const Duration(seconds: 1), () {
      setState(() {
        if (controller.seconds != 0) {
          controller.decreaseSeconds();
        }
      });
      delayedSecond();
    });
  }

  @override
  Widget build(BuildContext context) {
    return (controller.seconds != 0)
      ? Text(
          "$textResendCode ${controller.seconds}с",
          style: textLibrary.subText,
        )
      : Text(
          textGetNewCode,
          style: TextStyle(color: colorLibrary.colorAccent),
        ).tap(() {
          if (controller.seconds == 0) {
            widget.tapOnFinish();
          }
        });
  }
}
