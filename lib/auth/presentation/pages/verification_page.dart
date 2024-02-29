import 'package:drink_shop/auth/domain/verification_presenter.dart';
import 'package:drink_shop/auth/presentation/widgets/text_count_down_timer.dart';
import 'package:drink_shop/core/ui/dialogs/dialog_message.dart';
import 'package:drink_shop/core/values/nums.dart';
import 'package:drink_shop/core/values/strings.dart';
import 'package:drink_shop/core/ui/theme/state_with_library.dart';
import 'package:drink_shop/core/ui/widgets/Button.dart';
import 'package:drink_shop/core/utils/extensions.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';

class VerificationPage extends StatefulWidget {
  const VerificationPage({super.key, required this.email});

  final String email;

  @override
  StateWithLibrary<VerificationPage> createState() => _VerificationPageState();
}

class _VerificationPageState extends StateWithLibrary<VerificationPage> {

  int seconds = 60;
  bool isEnableSetNewPassword = false;
  bool isError = false;
  TextEditingController code = TextEditingController();
  TextCountDownTimerController textCountDownTimerController = TextCountDownTimerController(60);
  late VerificationPresenterImpl presenter;

  void refreshEnableSetNewPassword() {
    setState(() {
      isEnableSetNewPassword = code.length == 6 && !isError;
    });
  }

  void navigateTo(Route route) {
    Navigator.of(context).pushAndRemoveUntil(
      route,
      (_) => false
    );
  }

  void showError(String error){
    MessageDialog.showError(context, error);
    setState(() {
      isError = true;
    });
  }

  @override
  void initState() {
    super.initState();
    presenter = VerificationPresenterImpl(onNavigate: navigateTo, onError: showError);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorLibrary.colorBackground,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: mainHorizontalPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            83.asHeight(),
            Text(titleVerification, style: textLibrary.title),
            8.asHeight(),
            Text(textVerification, style: textLibrary.subTitle),
            58.asHeight(),
            Pinput(
              length: 6,
              controller: code,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              defaultPinTheme: library.libraryPinPut.defaultPinPut,
              submittedPinTheme: (isError) ? library.libraryPinPut.errorPinPut : library.libraryPinPut.submittedPinPut,
              focusedPinTheme: library.libraryPinPut.focusedPinPut,
              onChanged: (_) {
                isError = false;
                refreshEnableSetNewPassword();
              },
            ),
            48.asHeight(),
            TextCountDownTimer(
              tapOnFinish: (){
                setState(() {
                  textCountDownTimerController.resetSeconds();
                });
              },
              controller: textCountDownTimerController,
            ).align(Alignment.center),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Button(
                  text: textSetPassword,
                  isEnable: isEnableSetNewPassword,
                  onPressed: () {
                    presenter.pressButtonConfirmCode(
                      widget.email,
                      code.text
                    );
                  }
                ).fillWidth()
              ],
            ).expanded(),
            32.asHeight()
          ],
        ),
      ),
    );
  }
}