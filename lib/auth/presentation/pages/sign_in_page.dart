import 'package:drink_shop/auth/presentation/pages/forgot_password_page.dart';
import 'package:drink_shop/auth/presentation/pages/sign_up_page.dart';
import 'package:drink_shop/core/ui/theme/state_with_library.dart';
import 'package:drink_shop/core/ui/widgets/Button.dart';
import 'package:drink_shop/core/ui/widgets/Input.dart';
import 'package:drink_shop/core/ui/nums.dart';
import 'package:drink_shop/core/ui/strings.dart';
import 'package:drink_shop/core/utils/extensions.dart';
import 'package:drink_shop/core/utils/pair.dart';
import 'package:drink_shop/core/utils/validates.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  StateWithLibrary<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends StateWithLibrary<SignInPage> {
  bool rememberPassword = false;

  bool isEnableSignIn = false;
  var email = TextEditingController();
  var password = TextEditingController();

  void refreshEnableSignIn(_){
    setState(() {
      isEnableSignIn = validateEmail(email.text) &&
          password.text.isNotEmpty && password.text.length >= 6;
    });
  }

  void backToSignUp(){
    Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(builder: (_) => const SignUpPage()),
      (route) => false
    );
  }

  void navigateToForgotPassword(){
    Navigator.of(context).push(
        MaterialPageRoute(builder: (_) => const ForgotPasswordPage())
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: colorLibrary.colorBackground,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: mainHorizontalPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            83.asHeight(),
            Text(titleEnterAccount, style: textLibrary.title),
            8.asHeight(),
            Text(subtitleEnterAccount, style: textLibrary.subTitle),
            28.asHeight(),
            Input.email(controller: email, onChanged: refreshEnableSignIn),
            24.asHeight(),
            Input.password(controller: password, onChanged: refreshEnableSignIn),
            28.asHeight(),
            Row(
              children: [
                SizedBox.square(
                  dimension: 22,
                  child: Transform.scale(
                    scale: 1.2,
                    child: Checkbox(
                      value: rememberPassword,
                      onChanged: (newValue) {
                        setState(() {
                          rememberPassword = newValue!;
                        });
                      }),
                  ),
                ),
                8.asWidth(),
                Text(textRememberMe, style: textLibrary.subText).expanded(),
                Text(textForgotPassword, style: textLibrary.subTextAccent)
                    .tap(navigateToForgotPassword)
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Button(text: textSignIn, isEnable: isEnableSignIn).fillWidth(),
                14.asHeight(),
                GestureDetector(
                  onTap: backToSignUp,
                  child: RichTextExtension.generate(
                    [
                      Pair(textNotHaveAccountFirst, textLibrary.subText),
                      Pair(textNotHaveAccountSecond, textLibrary.subTextAccentBold),
                    ]
                  ),
                ),
                18.asHeight(),
                Text(signInGoogle, style: textLibrary.subText),
                8.asHeight(),
                SvgPicture.asset("assets/icons/google.svg"),
                28.asHeight()
              ],
            ).expanded()
          ],
        ),
      ),
    );
  }
}
