import 'package:drink_shop/auth/domain/forgot_password_usecase.dart';
import 'package:drink_shop/core/ui/dialogs/dialog_message.dart';
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
  late ForgotPasswordUseCaseImpl useCase;

  @override
  void initState() {
    super.initState();
    useCase = ForgotPasswordUseCaseImpl(
      onNavigate: navigateTo,
      onError: showError
    );
  }

  void refreshEnableSendCode(_){
    setState(() {
      isEnableSendCode = validateEmail(email.text);
    });
  }

  void navigateTo(Route route){
    Navigator.of(context).pushReplacement(route);
  }

  void showError(String error){
    MessageDialog.showError(context, error);
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
                  onPressed: (){
                    useCase.pressButtonSendCode(email.text);
                  }
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