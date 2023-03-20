import 'dart:ui';

enum TypographyToken {
  text10,
  text10SemiBold,
  text12,
  text12SemiBold,
  text12Bold,
  text14,
  text14SemiBold,
  text14Bold,
  text16,
  text16SemiBold,
  text16Bold,
  title20,
  title24,
  title32,
}

extension TypographyTokenExt on TypographyToken {
  String get fontFamily {
    switch (this) {
      case TypographyToken.text10:
        return "MontserratRegular";
      case TypographyToken.text10SemiBold:
        return "MontserratSemiBold";
      case TypographyToken.text12:
        return "MontserratRegular";
      case TypographyToken.text12SemiBold:
        return "MontserratSemiBold";
      case TypographyToken.text12Bold:
        return "MontserratBold";
      case TypographyToken.text14:
        return "MontserratRegular";
      case TypographyToken.text14SemiBold:
        return "MontserratSemiBold";
      case TypographyToken.text14Bold:
        return "MontserratBold";
      case TypographyToken.text16:
        return "MontserratRegular";
      case TypographyToken.text16SemiBold:
        return "MontserratSemiBold";
      case TypographyToken.text16Bold:
        return "MontserratBold";
      case TypographyToken.title20:
        return "MontserratBold";
      case TypographyToken.title24:
        return "MontserratBold";
      case TypographyToken.title32:
        return "MontserratBold";
      default:
        return "MontserratRegular";
    }
  }

  double get fontSize {
    switch (this) {
      case TypographyToken.text10:
        return 10.0;
      case TypographyToken.text10SemiBold:
        return 10.0;
      case TypographyToken.text12:
        return 12.0;
      case TypographyToken.text12SemiBold:
        return 12.0;
      case TypographyToken.text12Bold:
        return 12.0;
      case TypographyToken.text14:
        return 14.0;
      case TypographyToken.text14SemiBold:
        return 14.0;
      case TypographyToken.text14Bold:
        return 14.0;
      case TypographyToken.text16:
        return 16.0;
      case TypographyToken.text16SemiBold:
        return 16.0;
      case TypographyToken.text16Bold:
        return 16.0;
      case TypographyToken.title20:
        return 20.0;
      case TypographyToken.title24:
        return 24.0;
      case TypographyToken.title32:
        return 32.0;
      default:
        return 12.0;
    }
  }

  FontWeight get fontWeight {
    switch (this) {
      case TypographyToken.text10:
        return FontWeight.w400;
      case TypographyToken.text10SemiBold:
        return FontWeight.w600;
      case TypographyToken.text12:
        return FontWeight.w400;
      case TypographyToken.text12SemiBold:
        return FontWeight.w600;
      case TypographyToken.text12Bold:
        return FontWeight.w600;
      case TypographyToken.text14:
        return FontWeight.w400;
      case TypographyToken.text14SemiBold:
        return FontWeight.w600;
      case TypographyToken.text14Bold:
        return FontWeight.w600;
      case TypographyToken.text16:
        return FontWeight.w400;
      case TypographyToken.text16SemiBold:
        return FontWeight.w600;
      case TypographyToken.text16Bold:
        return FontWeight.w600;
      case TypographyToken.title20:
        return FontWeight.w600;
      case TypographyToken.title24:
        return FontWeight.w600;
      case TypographyToken.title32:
        return FontWeight.w600;
      default:
        return FontWeight.w400;
    }
  }
}
