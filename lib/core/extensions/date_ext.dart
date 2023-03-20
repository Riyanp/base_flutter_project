import 'package:intl/intl.dart';

extension DateExt on DateTime? {
  String formatDateTime({required String format}) {
    return DateFormat(format, 'id').format(this ?? DateTime.now());
  }
}
