import 'package:intl/intl.dart';

extension NumberExt on int? {
  String get formatCurrency {
    return NumberFormat.currency(
      locale: "id",
      symbol: "Rp",
      decimalDigits: 0,
    ).format(this);
  }

  String get formatDecimal {
    return NumberFormat.currency(
      symbol: "",
      decimalDigits: 0,
    ).format(this);
  }

  int get orZero {
    return this ?? 0;
  }
}

extension DoubleExt on double? {
  String get formatCurrency {
    return NumberFormat.currency(
      locale: "id",
      symbol: "Rp",
      decimalDigits: 2,
    ).format(this);
  }

  String get formatDecimal {
    return NumberFormat.currency(
      symbol: "",
      decimalDigits: 2,
    ).format(this);
  }
}

extension NumExtensions on num {
  bool get isInt => (this % 1) == 0;

  String get toRupiahFormat {
    return isInt ? toInt().formatCurrency : toDouble().formatCurrency;
  }

  String get toDecimalFormat {
    return isInt ? toInt().formatDecimal : toDouble().formatDecimal;
  }
}
