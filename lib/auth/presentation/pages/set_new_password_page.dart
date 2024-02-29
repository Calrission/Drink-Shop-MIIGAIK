import 'package:drink_shop/auth/presentation/pages/sign_in_page.dart';
import 'package:drink_shop/core/values/nums.dart';
import 'package:drink_shop/core/values/strings.dart';
import 'package:drink_shop/core/ui/theme/state_with_library.dart';
import 'package:drink_shop/core/ui/widgets/Button.dart';
import 'package:drink_shop/core/ui/widgets/Input.dart';
import 'package:drink_shop/core/utils/extensions.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';

class SetNewPasswordPage extends StatefulWidget {
  const SetNewPasswordPage({super.key});

  @override
  StateWithLibrary<SetNewPasswordPage> createState() =>
      _SetNewPasswordPageState();
}

class _SetNewPasswordPageState extends StateWithLibrary<SetNewPasswordPage> {
  bool isEnableConfirm = false;
  TextEditingController password = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();
  
  void backToSignIn(){
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (_) => const SignInPage()),
        (route) => false
    );
  }
  
  void refreshIsEnableConfirm(_) {
    setState(() {
      isEnableConfirm =
          password.length >= 6 && password.text == confirmPassword.text;
    });
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
            Text(titleNewPassword, style: textLibrary.title),
            8.asHeight(),
            Text(textNewPassword, style: textLibrary.subTitle),
            28.asHeight(),
            Input.password(
              controller: password,
              onChanged: refreshIsEnableConfirm
            ),
            24.asHeight(),
            Input.confirmPassword(
              controller: confirmPassword,
              onChanged: refreshIsEnableConfirm
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Button(
                  text: textConfirmPassword,
                  isEnable: isEnableConfirm,
                  onPressed: backToSignIn,
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
