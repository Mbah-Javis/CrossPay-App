import 'package:flutter/material.dart';
import 'package:crosspay/theme/colors.dart';

class CPInputTextField extends StatelessWidget {
  const CPInputTextField(
      {super.key,
      required this.hint,
      required this.controller,
      this.autoFocus,
      this.readOnly,
      this.textStyle,
      this.hintStyle,
      this.backgroundColor,
      this.cursorColor,
      this.minLines,
      this.maxLines,
      this.maxLength,
      this.keyboardType,
      this.textInputAction,
      this.validator,
      this.icon,
      this.suffixIcon,
      this.onChanged,
      required this.onFieldSubmitted,
      this.expands});

  final TextEditingController controller;
  final String hint;
  final bool? readOnly;
  final bool? autoFocus;
  final int? maxLines;
  final int? minLines;
  final int? maxLength;
  final bool? expands;
  final TextStyle? textStyle;
  final TextStyle? hintStyle;
  final Color? backgroundColor;
  final Color? cursorColor;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final String? Function(String?)? validator;
  final Widget? icon;
  final Widget? suffixIcon;
  final Function(String)? onChanged;
  final Function(String) onFieldSubmitted;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
          color: kInputBgColor, borderRadius: BorderRadius.circular(15)),
      child: TextFormField(
        readOnly: readOnly ?? false,
        scrollPhysics: const BouncingScrollPhysics(),
        autofocus: autoFocus ?? false,
        cursorColor: cursorColor ?? kPrimaryColor,
        validator: validator,
        onChanged: (value) {
          if (onChanged != null) {
            onChanged!(value);
          }
        },
        onFieldSubmitted: (value) {
          onFieldSubmitted(value);
        },
        maxLines: maxLines ?? 1,
        minLines: minLines,
        maxLength: maxLength,
        expands: expands ?? false,
        controller: controller,
        keyboardType: keyboardType,
        textInputAction: textInputAction,
        style: textStyle ?? _defaultTextStyle(context, kNeutralColor),
        decoration: InputDecoration(
            border: InputBorder.none,
            hintText: hint,
            hintStyle: hintStyle ?? _defaultTextStyle(context, kNeutralColor50),
            counterText: '',
            icon: icon,
            suffix: suffixIcon),
      ),
    );
  }

  TextStyle _defaultTextStyle(BuildContext context, Color color) {
    return Theme.of(context).textTheme.bodyMedium!.copyWith(color: color);
  }
}
