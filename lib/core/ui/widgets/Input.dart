import 'package:drink_shop/core/app.dart';
import 'package:drink_shop/core/values/strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Input extends StatefulWidget {
  final String label;
  final String example;
  final TextEditingController? controller;
  final bool enableObscure;
  final Function(String)? onChanged;

  const Input(
    {
      super.key,
      required this.label,
      required this.example,
      this.controller,
      this.enableObscure = false,
      this.onChanged,
    }
  );

  const Input.fullName(
    {
      super.key,
      this.controller,
      this.onChanged
    }
  ): label = labelFullName, example = exampleFullName, enableObscure = false;

  const Input.email(
    {
      super.key,
      this.controller,
      this.onChanged
    }
  ): label = labelEmail, example = exampleEmail, enableObscure = false;

  const Input.password(
    {
      super.key,
      this.controller,
      this.onChanged
    }
  ): label = labelPassword, example = examplePassword, enableObscure = true;

  const Input.confirmPassword(
    {
      super.key,
      this.controller,
      this.onChanged
    }
  ): label = labelConfirmPassword, example = exampleConfirmPassword, enableObscure = true;

  @override
  State<Input> createState() => _InputState();
}

class _InputState extends State<Input> {

  bool isObscure = false;

  @override
  void initState() {
    super.initState();
    isObscure = (widget.enableObscure) ? true : false;
  }

  @override
  Widget build(BuildContext context) {
    var textLibrary = MyApp.library(context).libraryTextThemes;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.label,
          style: textLibrary.label,
        ),
        const SizedBox(height: 8),
        TextField(
          obscureText: isObscure,
          style: textLibrary.text,
          obscuringCharacter: "*",
          controller: widget.controller,
          onChanged: widget.onChanged,
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.symmetric(
              vertical: 14,
              horizontal: 10
            ),
            hintText: widget.example,
            hintStyle: textLibrary.hint,
            suffixIcon: (widget.enableObscure) ? GestureDetector(
              onTap: (){
                setState(() {
                  isObscure = !isObscure;
                });
              },
              child: UnconstrainedBox(
                child: SvgPicture.asset(
                    (isObscure) ? "assets/icons/eye-slash.svg" : "assets/icons/eye.svg"
                ),
              ),
            ) : null,
          ),
        ),
      ],
    );
  }
}