import 'package:flutter/material.dart';
import 'package:crosspay/theme/colors.dart';

class CPLoadingWidget extends StatelessWidget {
  const CPLoadingWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: 40,
      child: CircularProgressIndicator(
        color: kPrimaryColor,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        strokeWidth: 8,
      ),
    );
  }
}
