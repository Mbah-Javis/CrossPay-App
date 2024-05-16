import 'package:intl/intl.dart';

class TextFormatter {
  TextFormatter() {}
  String formatPhoneNumber(String phoneNumber) {
    String cleanedPhoneNumber = phoneNumber.replaceAll(RegExp(r'[^\d]'), '');

    final StringBuffer formattedPhoneNumber = StringBuffer();
    for (int i = 0; i < cleanedPhoneNumber.length; i++) {
      formattedPhoneNumber.write(cleanedPhoneNumber[i]);
      if (i == 1 || i == 4) {
        formattedPhoneNumber.write(' ');
      }
    }
    return '($formattedPhoneNumber';
  }

  String formatCurrency(String currency, double amount) {
    final currencyFormatter = NumberFormat.currency(
        locale: 'en_US', symbol: currency, decimalDigits: 0);

    String formattedAmount = currencyFormatter.format(amount);
    String symbol = currencyFormatter.currencySymbol ?? '';
    String formattedAmountWithoutSymbol =
        formattedAmount.replaceAll(symbol, '');

    return '$formattedAmountWithoutSymbol $currency';
  }
}
