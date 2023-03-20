import 'package:flutter/material.dart';

class AppThemes {
  /// Colors from Tailwind CSS
  ///
  /// https://tailwindcss.com/docs/customizing-colors

  static const int _primaryColor = 0xFF26A6D1;
  static const MaterialColor primarySwatch =
      MaterialColor(_primaryColor, <int, Color>{
    50: Color(0x5F26A6D1),
    100: Color(0x8926A6D1),
    200: Color(0xA526A6D1),
    300: Color(0xC726A6D1),
    400: Color(0xE526A6D1),
    500: Color(_primaryColor),
    600: Color(0xE526A6D1),
    700: Color(0xE526A6D1),
    800: Color(0xE526A6D1),
    900: Color(0xE526A6D1),
  });

  static const int _secondaryColor = 0xFFA6CEF2;
  static const MaterialColor secondarySwatch =
  MaterialColor(_secondaryColor, <int, Color>{
    50: Color(0x30A6CEF2),
    100: Color(0x56A6CEF2),
    200: Color(_secondaryColor),
    300: Color(0x7EA6CEF2),
    400: Color(0x96A6CEF2),
    500: Color(0xB3A6CEF2),
    600: Color(0xD8A6CEF2),
    700: Color(0xEDA6CEF2),
    800: Color(0xF0A6CEF2),
    900: Color(0xFFA6CEF2),
  });

  static const int _textColor = 0xFF6B7280;
  static const MaterialColor textSwatch =
      MaterialColor(_textColor, <int, Color>{
    50: Color(0xFFF9FAFB),
    100: Color(0xFFF3F4F6),
    200: Color(0xFFE5E7EB),
    300: Color(0xFFD1D5DB),
    400: Color(0xFF9CA3AF),
    500: Color(_textColor),
    600: Color(0xFF4B5563),
    700: Color(0xFF374151),
    800: Color(0xFF1F2937),
    900: Color(0xFF111827),
  });

  static final lightTheme = ThemeData(
    primarySwatch: primarySwatch,
    brightness: Brightness.light,
    scaffoldBackgroundColor: Colors.white,
    backgroundColor: Colors.white,
    cardColor: Colors.white,
    bottomAppBarColor: Colors.white,
    dividerColor: const Color(0x1C000000),
    textTheme: TextTheme(
      headline1: TextStyle(
        color: textSwatch.shade700,
        fontWeight: FontWeight.w300,
      ),
      headline2: TextStyle(
        color: textSwatch.shade600,
      ),
      headline3: TextStyle(
        color: textSwatch.shade700,
      ),
      headline4: TextStyle(
        color: textSwatch.shade700,
      ),
      headline5: TextStyle(
        color: textSwatch.shade600,
      ),
      headline6: TextStyle(
        color: textSwatch.shade700,
      ),
      subtitle1: TextStyle(
        color: textSwatch.shade700,
      ),
      subtitle2: TextStyle(
        color: textSwatch.shade600,
      ),
      bodyText1: TextStyle(
        color: textSwatch.shade700,
      ),
      bodyText2: TextStyle(
        color: textSwatch.shade500,
      ),
      button: TextStyle(
        color: textSwatch.shade500,
      ),
      caption: TextStyle(
        color: textSwatch.shade500,
      ),
      overline: TextStyle(
        color: textSwatch.shade500,
      ),
    ),
  );

  static final darkTheme = lightTheme.copyWith(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: const Color(0xFF24242a),
    backgroundColor: const Color(0xFF24242a),
    cardColor: const Color(0xFF2f2f34),
    bottomAppBarColor: const Color(0xFF35353a),
    dividerColor: const Color(0x1CFFFFFF),
    textTheme: TextTheme(
      headline1: TextStyle(
        color: textSwatch.shade200,
        fontWeight: FontWeight.w300,
      ),
      headline2: TextStyle(
        color: textSwatch.shade300,
      ),
      headline3: TextStyle(
        color: textSwatch.shade200,
      ),
      headline4: TextStyle(
        color: textSwatch.shade200,
      ),
      headline5: TextStyle(
        color: textSwatch.shade300,
      ),
      headline6: TextStyle(
        color: textSwatch.shade200,
      ),
      subtitle1: TextStyle(
        color: textSwatch.shade200,
      ),
      subtitle2: TextStyle(
        color: textSwatch.shade300,
      ),
      bodyText1: TextStyle(
        color: textSwatch.shade300,
      ),
      bodyText2: TextStyle(
        color: textSwatch.shade200,
      ),
      button: TextStyle(
        color: textSwatch.shade400,
      ),
      caption: TextStyle(
        color: textSwatch.shade400,
      ),
      overline: TextStyle(
        color: textSwatch.shade400,
      ),
    ),
  );

  static const shimmerGradient = LinearGradient(
    colors: [
      Color(0xFFEBEBF4),
      Color(0xFFF4F4F4),
      Color(0xFFEBEBF4),
    ],
    stops: [
      0.1,
      0.3,
      0.4,
    ],
    begin: Alignment(-1.0, -0.3),
    end: Alignment(1.0, 0.3),
    tileMode: TileMode.clamp,
  );

  static const tmsColor = Color(0xFF4A8F29);
  static const tmsGradientColor = Color(0xFFACCC2C);
  static const insuranceColor = Color(0xFF1A8457);
  static const insuranceGradientColor = Color(0xFF4CE2BE);
  static const purchaseColor = Color(0xFF2284A3);
  static const purchaseGradientColor = Color(0xFF43ABCC);
  static const repairColor = Color(0xFFA32222);
  static const repairGradientColor = Color(0xFFFC3434);

  static const pendingBgColor = Color(0xFFEB9E86);
  static const pendingTextColor = Color(0xFF9A0000);
  static const approvedBgBgColor = Color(0xFF86EB9C);
  static const approvedTextColor = Color(0xFF009A22);
  static const doneBgColor = Color(0xFF4EC9F5);
  static const doneTextColor = Color(0xFF015973);
}
