import 'package:drink_shop/auth/data/models/sign_up_model.dart';
import 'package:drink_shop/auth/domain/sign_up_usecase.dart';
import 'package:drink_shop/auth/presentation/pages/sign_in_page.dart';
import 'package:drink_shop/core/ui/dialogs/dialog_message.dart';
import 'package:drink_shop/core/ui/theme/state_with_library.dart';
import 'package:drink_shop/core/ui/widgets/Button.dart';
import 'package:drink_shop/core/ui/widgets/Input.dart';
import 'package:drink_shop/core/values/nums.dart';
import 'package:drink_shop/core/utils/extensions.dart';
import 'package:drink_shop/core/values/strings.dart';
import 'package:drink_shop/core/utils/pair.dart';
import 'package:drink_shop/core/utils/validates.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  StateWithLibrary<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends StateWithLibrary<SignUpPage> {

  bool isEnableSignUp = false;
  var fullName = TextEditingController();
  var email = TextEditingController();
  var password = TextEditingController();
  var confirmPassword = TextEditingController();

  late SignUpUseCaseImpl signUpUseCase;

  void navigateTo(Route route){
    Navigator.of(context).pushReplacement(
        route
    );
  }

  void showError(String error){
    MessageDialog.showError(context, error);
  }

  @override
  void initState() {
    super.initState();
    signUpUseCase = SignUpUseCaseImpl(
        onNavigateTo: navigateTo, onError: showError
    );
  }

  void refreshEnableSignUp(_){
    setState(() {
      isEnableSignUp = fullName.text.isNotEmpty &&
          validateEmail(email.text) && password.text.isNotEmpty &&
          confirmPassword.text == password.text && password.text.length >= 6;
    });
  }

  void pressSignUpButton(){
    SignUpModel signUpModel = SignUpModel(
      fullName: fullName.text,
      email: email.text,
      password: password.text
    );
    signUpUseCase.pressButtonSignUp(signUpModel);
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
            Text(titleCreateAccount, style: textLibrary.title),
            8.asHeight(),
            Text(subtitleCreateAccount, style: textLibrary.subTitle),
            28.asHeight(),
            Input.fullName(
              controller: fullName,
              onChanged: refreshEnableSignUp
            ),
            24.asHeight(),
            Input.email(
              controller: email,
              onChanged: refreshEnableSignUp
            ),
            24.asHeight(),
            Input.password(
              controller: password,
              onChanged: refreshEnableSignUp
            ),
            24.asHeight(),
            Input.confirmPassword(
              controller: confirmPassword,
              onChanged: refreshEnableSignUp
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Button(
                  onPressed: pressSignUpButton,
                  text: textSignUp,
                  isEnable: isEnableSignUp
                ).fillWidth(),
                14.asHeight(),
                GestureDetector(
                  onTap: (){
                    navigateTo(
                      MaterialPageRoute(builder: (_) => const SignInPage())
                    );
                  },
                  child: RichTextExtension.generate(
                    [
                      Pair(textAlreadyHaveAccountFirst, textLibrary.subText),
                      Pair(textSignIn, textLibrary.subTextAccentBold),
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