import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';

class LibraryTheme {
  late final LibraryColors libraryColors;
  late final ThemeData themeData;
  late final LibraryTextThemes libraryTextThemes;
  late final LibraryPinPut libraryPinPut;

  LibraryTheme(
    {
      required this.libraryColors,
      required this.themeData, 
      required this.libraryTextThemes,
      required this.libraryPinPut,
    }
  );
}

class LibraryPinPut {
  late final PinTheme defaultPinPut;
  late final PinTheme submittedPinPut;
  late final PinTheme focusedPinPut;
  late final PinTheme errorPinPut;

  LibraryPinPut(
    {
      required this.defaultPinPut,
      required this.submittedPinPut,
      required this.focusedPinPut,
      required this.errorPinPut,
    }
  );
}

class LibraryColors {
  late final Color colorAccent;
  late final Color colorAccentDisable;
  late final Color colorAccentOpacity;
  late final Color colorBackground;
  late final Color colorBlock;
  late final Color colorSubBlock;
  late final Color colorText;
  late final Color colorSubtext;
  late final Color colorTextAccent;
  late final Color colorHint;
  late final Color colorLabel;
  late final Color colorLineSeparator;
  late final Color colorCheckStatus;
  late final Color colorNotCheckStatus;
  late final Color colorStartLinearGradient;
  late final Color colorEndLinearGradient;
  late final Color colorPrice;
  late final Color colorStroke;
  late final Color colorStrokeCheckbox;
  late final Color colorStar;
  late final Color colorError;

  LibraryColors(
    {
      required this.colorAccent,
      required this.colorAccentDisable,
      required this.colorAccentOpacity,
      required this.colorBackground,
      required this.colorBlock,
      required this.colorSubBlock,
      required this.colorText,
      required this.colorSubtext,
      required this.colorTextAccent,
      required this.colorHint,
      required this.colorLabel,
      required this.colorLineSeparator,
      required this.colorCheckStatus,
      required this.colorNotCheckStatus,
      required this.colorStartLinearGradient,
      required this.colorEndLinearGradient,
      required this.colorPrice,
      required this.colorStroke,
      required this.colorStrokeCheckbox,
      required this.colorStar,
      required this.colorError,
    }
  );
}

class LibraryTextThemes {
  late final TextStyle title;
  late final TextStyle subTitle;
  late final TextStyle subTextAccentBold;
  late final TextStyle subTextAccent;
  late final TextStyle button;
  late final TextStyle label;
  late final TextStyle text;
  late final TextStyle hint;
  late final TextStyle subText;

  LibraryTextThemes(
    {
      required this.title,
      required this.subTitle,
      required this.subTextAccent,
      required this.subTextAccentBold,
      required this.button,
      required this.label,
      required this.text,
      required this.hint,
      required this.subText
    }
  );
}