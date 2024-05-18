import 'package:flutter/material.dart';

class CPSpacer {
  SizedBox heightSmall() {
    return const SizedBox(
      height: 10.0,
    );
  }

  SizedBox heightMedium() {
    return const SizedBox(
      height: 15.0,
    );
  }

  SizedBox height(double height) {
    return SizedBox(height: height);
  }

  SizedBox width(double width) {
    return SizedBox(width: width);
  }

  EdgeInsets screenPadding() {
    return const EdgeInsets.symmetric(horizontal: 15.0);
  }
}
