import 'package:drink_shop/auth/presentation/pages/set_new_password_page.dart';
import 'package:drink_shop/core/ui/nums.dart';
import 'package:drink_shop/core/ui/strings.dart';
import 'package:drink_shop/core/ui/theme/state_with_library.dart';
import 'package:drink_shop/core/ui/widgets/Button.dart';
import 'package:drink_shop/core/utils/extensions.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';

class VerificationPage extends StatefulWidget {
  const VerificationPage({super.key});

  @override
  StateWithLibrary<VerificationPage> createState() => _VerificationPageState();
}

class _VerificationPageState extends StateWithLibrary<VerificationPage> {

  bool isEnableSetNewPassword = false;
  TextEditingController code = TextEditingController();

  void refreshEnableSetNewPassword(_) {
    setState(() {
      isEnableSetNewPassword = code.length == 6;
    });
  }

  void navigateToSetNewPassword() {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (_) => const SetNewPasswordPage())
    );
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
              submittedPinTheme: library.libraryPinPut.submittedPinPut,
              focusedPinTheme: library.libraryPinPut.focusedPinPut,
              onChanged: refreshEnableSetNewPassword,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Button(
                  text: textSetPassword,
                  isEnable: isEnableSetNewPassword,
                  onPressed: navigateToSetNewPassword
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