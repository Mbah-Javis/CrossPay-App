import 'package:flutter/material.dart';

class CPSpacer {
  SizedBox heightSmall() {
    return SizedBox(
      height: 10.0,
    );
  }

  SizedBox heightMedium() {
    return SizedBox(
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
    return EdgeInsets.symmetric(horizontal: 15.0);
  }
}
