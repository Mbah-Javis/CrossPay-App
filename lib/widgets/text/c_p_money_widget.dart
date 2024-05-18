import 'package:flutter/material.dart';
import 'package:crosspay/utils/text_formatter.dart';

class CPMoneyWidget extends StatelessWidget {
  const CPMoneyWidget(
      {super.key,
      required this.amount,
      required this.currency,
      required this.textStyle});

  final double? amount;
  final String? currency;
  final TextStyle textStyle;

  @override
  Widget build(BuildContext context) {
    return Text(
      TextFormatter().formatCurrency(currency ?? 'XAF', amount ?? 0.0),
      style: textStyle,
    );
  }
}
