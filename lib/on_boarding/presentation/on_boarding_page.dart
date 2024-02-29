import 'package:drink_shop/auth/presentation/pages/sign_up_page.dart';
import 'package:drink_shop/core/ui/theme/state_with_library.dart';
import 'package:drink_shop/core/ui/widgets/Button.dart';
import 'package:drink_shop/core/utils/extensions.dart';
import 'package:drink_shop/on_boarding/domain/on_boarding_presenter.dart';
import 'package:flutter/material.dart';

class OnBoardingPage extends StatefulWidget {
  const OnBoardingPage({super.key});

  @override
  StateWithLibrary<OnBoardingPage> createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends StateWithLibrary<OnBoardingPage> {

  late final OnBoardingPresenterImpl presenter;

  @override
  void initState() {
    super.initState();
    presenter = OnBoardingPresenterImpl(
      onNext: onNext,
      onComplete: onComplete
    );
  }

  void onNext() {
    setState(() {});
  }

  void onComplete() {
    Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (_) => const SignUpPage())
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          Image.asset(
            presenter.currentOnBoardingModel.cover,
            width: double.infinity,
            fit: BoxFit.fill,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                padding: const EdgeInsets.only(
                  left: 30,
                  right: 30,
                  bottom: 42,
                ),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Colors.black.withAlpha(0),
                      Colors.black
                    ],
                    stops: const [
                      0.0,
                      0.3
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter
                  )
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    18.asHeight(),
                    Text(
                      presenter.currentOnBoardingModel.title,
                      style: const TextStyle(
                        fontSize: 34,
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        height: 1.2
                      ),
                      textAlign: TextAlign.center,
                    ),
                    24.asHeight(),
                    Text(
                      presenter.currentOnBoardingModel.text,
                      textAlign: TextAlign.center,
                      style: TextStyle(color: colorLibrary.colorHint),
                    ),
                    24.asHeight(),
                    Button(
                      text: presenter.currentOnBoardingModel.textButton,
                      isEnable: true,
                      onPressed: presenter.pressButton,
                    ).fillWidth()
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}