import 'package:base_flutter_project/core/extensions/date_ext.dart';
import 'package:base_flutter_project/core/extensions/number_ext.dart';
import 'package:intl/intl.dart';

extension StringExt on String {
  String getInitials() {
    return trim().split(RegExp(' +')).map((e) => e[0]).take(2).join();
  }

  String toFormattedDate({String? format, String? stringDateFormat}) {
    try {
      return DateFormat(stringDateFormat ?? "yyyy-MM-dd")
          .parse(this)
          .formatDateTime(format: format ?? "dd MMMM yyyy");
    } catch (e) {
      const FormatException("Format Date tidak sesuai");
    }
    return "-";
  }

  String orEmpty() {
    return this ?? "";
  }
}

extension StringNullExt on String? {
  String get orEmpty => this ?? "";

  String get toRupiahFormat {
    if (this != null) {
      if (this?.contains(".") == true) {
        return double.parse(this ?? "0").toRupiahFormat;
      }
      return int.parse(this ?? "0").toRupiahFormat;
    }
    return "Rp0";
  }

  String get toDecimalFormat {
    if (this != null) {
      if (this?.contains(".") == true) {
        return double.parse(this ?? "0").toDecimalFormat;
      }
      return int.parse(this ?? "0").toDecimalFormat;
    }
    return "0.0";
  }

  String get capitalize {
    if ((this?.length ?? 0) > 0) {
      return "${(this ?? "")[0].toUpperCase()}${(this ?? "").substring(1).toLowerCase()}";
    } else {
      return "";
    }
  }
}
