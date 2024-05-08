import 'package:crosspay/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';

class CPPinInputField extends StatelessWidget {
  CPPinInputField(
      {Key? key,
      required this.controller,
      required this.focusNode,
      required this.showError,
      required this.onComplete})
      : super(key: key);
  final TextEditingController controller;
  final FocusNode focusNode;
  final bool showError;
  final Function(String otp) onComplete;

  @override
  Widget build(BuildContext context) {
    const length = 6;
    final defaultPinTheme = PinTheme(
      width: 50,
      height: 60,
      textStyle: Theme.of(context).textTheme.titleMedium,
      decoration: BoxDecoration(
        color: kInputBgColor,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.transparent),
      ),
    );

    return SizedBox(
      height: 68,
      child: Pinput(
        length: length,
        controller: controller,
        focusNode: focusNode,
        defaultPinTheme: defaultPinTheme,
        onCompleted: (pin) {
          onComplete(pin);
        },
        focusedPinTheme: defaultPinTheme.copyWith(
          height: 60,
          width: 50,
          decoration: defaultPinTheme.decoration!.copyWith(
            border: Border.all(color: kPrimaryColor),
          ),
        ),
        errorPinTheme: defaultPinTheme.copyWith(
          decoration: BoxDecoration(
            color: kErrorColor.withOpacity(0.1),
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ),
    );
  }
}
