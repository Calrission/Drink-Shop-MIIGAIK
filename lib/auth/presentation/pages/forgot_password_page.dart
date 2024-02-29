import 'package:drink_shop/auth/presentation/pages/verification_page.dart';
import 'package:drink_shop/core/values/nums.dart';
import 'package:drink_shop/core/values/strings.dart';
import 'package:drink_shop/core/ui/theme/state_with_library.dart';
import 'package:drink_shop/core/ui/widgets/Button.dart';
import 'package:drink_shop/core/ui/widgets/Input.dart';
import 'package:drink_shop/core/utils/extensions.dart';
import 'package:drink_shop/core/utils/validates.dart';
import 'package:flutter/material.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({super.key});

  @override
  StateWithLibrary<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends StateWithLibrary<ForgotPasswordPage> {

  var email = TextEditingController();
  var isEnableSendCode = false;

  void refreshEnableSendCode(_){
    setState(() {
      isEnableSendCode = validateEmail(email.text);
    });
  }

  void navigateToVerification(){
    Navigator.of(context).push(
      MaterialPageRoute(builder: (_) => const VerificationPage())
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorLibrary.colorBackground,
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: mainHorizontalPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            83.asHeight(),
            Text(titleRecoveryPassword, style: textLibrary.title),
            8.asHeight(),
            Text(textEnterEmail, style: textLibrary.subTitle),
            28.asHeight(),
            Input.email(controller: email, onChanged: refreshEnableSendCode),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Button(
                  text: textSendEmail,
                  isEnable: isEnableSendCode,
                  onPressed: navigateToVerification
                ).fillWidth(),
                32.asHeight()
              ],
            ).expanded()
          ],
        ),
      ),
    );
  }
}