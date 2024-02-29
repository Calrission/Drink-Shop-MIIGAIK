import 'package:drink_shop/core/ui/theme/library_theme.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';

var lightLibraryTheme = LibraryTheme(
    libraryColors: lightLibraryColors,
    libraryTextThemes: lightLibraryTextThemes,
    themeData:  ThemeData(
      fontFamily: "Sora",
      inputDecorationTheme: const InputDecorationTheme(
        helperStyle: TextStyle(
          color: Color(0xFFA7A7A7),
        ),
        hintStyle: TextStyle(
            color: Color(0xFFCFCFCF)
        ),
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Color(0xFFA7A7A7))
        ),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Color(0xFFA7A7A7))
        ),
        errorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Color(0xFFED3A3A))
        ),
      ),
      checkboxTheme: CheckboxThemeData(
          fillColor: MaterialStateProperty.resolveWith((states) {
            return (states.contains(MaterialState.selected)) ? lightLibraryColors.colorAccent : lightLibraryColors.colorBackground;
          }),
          side: BorderSide(
            color: lightLibraryColors.colorStrokeCheckbox,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(6)
          )
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
          style: OutlinedButton.styleFrom(
            textStyle: lightLibraryTextThemes.button,
            padding: const EdgeInsets.symmetric(horizontal: 36, vertical: 15),
            side: BorderSide(color: lightLibraryColors.colorAccent),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(4)
            ),
          )
      ),
      filledButtonTheme: FilledButtonThemeData(
          style: FilledButton.styleFrom(
              textStyle: lightLibraryTextThemes.button,
              padding: const EdgeInsets.symmetric(horizontal: 36, vertical: 15),
              backgroundColor: lightLibraryColors.colorAccent,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4)
              ),
              disabledBackgroundColor: const Color(0xFFA7A7A7),
              disabledForegroundColor: Colors.white
          )
      ),
      colorScheme: ColorScheme.fromSeed(
          seedColor: lightLibraryColors.colorAccent,
          primary: lightLibraryColors.colorAccent
      ),
      useMaterial3: true,
    ),
  libraryPinPut: LibraryPinPut(
    defaultPinPut: PinTheme(
      width: 32,
      height: 32,
      decoration: BoxDecoration(
        border: Border.all(color: lightLibraryColors.colorLabel),
      ),
    ),
    submittedPinPut: PinTheme(
      width: 32,
      height: 32,
      decoration: BoxDecoration(
        border: Border.all(color: lightLibraryColors.colorAccent),
      ),
    ),
    focusedPinPut: PinTheme(
      width: 32,
      height: 32,
      decoration: BoxDecoration(
        border: Border.all(color: lightLibraryColors.colorLabel),
      ),
    ),
    errorPinPut: PinTheme(
      width: 32,
      height: 32,
      decoration: BoxDecoration(
        border: Border.all(color: lightLibraryColors.colorError),
      ),
    ),
  ),
);

var lightLibraryColors = LibraryColors(
    colorAccent: const Color(0xFFC67C4E),
    colorAccentOpacity: const Color(0xFFFFF5EE),
    colorAccentDisable: const Color(0xFFA7A7A7),
    colorPrice: const Color(0xFF2F4B4E),
    colorBackground: const Color(0xFFF9F9F9),
    colorBlock: const Color(0xFFFFFFFF),
    colorSubBlock: const Color(0xFFF2F2F2),
    colorStar: const Color(0xFFFBBE21),
    colorText: const Color(0xFF3A3A3A),
    colorHint: const Color(0xFFCFCFCF),
    colorLabel: const Color(0xFF818181),
    colorTextAccent: const Color(0xFFFFFFFF),
    colorSubtext: const Color(0xFF9B9B9B),
    colorStroke: const Color(0xFFDEDEDE),
    colorStrokeCheckbox: const Color(0xFFA7A7A7),
    colorLineSeparator: const Color(0xFFEAEAEA),
    colorCheckStatus: const Color(0xFF36C07E),
    colorNotCheckStatus: const Color(0xFFDFDFDF),
    colorStartLinearGradient: const Color(0xFF2F2D2C),
    colorEndLinearGradient: const Color(0xFF131313),
    colorError: const Color(0xFFFF0000)
);

var lightLibraryTextThemes = LibraryTextThemes(
    title: TextStyle(fontSize: 24, fontWeight: FontWeight.w600, color: lightLibraryColors.colorText),
    subTitle: TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: lightLibraryColors.colorLabel),
    subTextAccentBold: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: lightLibraryColors.colorAccent),
    subTextAccent: TextStyle(fontSize: 14, fontWeight: FontWeight.normal, color: lightLibraryColors.colorAccent),
    button: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: lightLibraryColors.colorTextAccent),
    label: TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: lightLibraryColors.colorLabel),
    text: TextStyle(fontSize: 14, fontWeight: FontWeight.normal, color: lightLibraryColors.colorText),
    hint: TextStyle(fontSize: 14, fontWeight: FontWeight.normal, color: lightLibraryColors.colorHint),
    subText: TextStyle(fontSize: 14, fontWeight: FontWeight.normal, color: lightLibraryColors.colorLabel),
);