import 'package:intl/intl.dart';

String formatCurrency(int price) {
  var currencyFormat = NumberFormat.currency(
    locale: "id",
    symbol: "Rp",
    decimalDigits: 0,
  );

  return currencyFormat.format(price);
}