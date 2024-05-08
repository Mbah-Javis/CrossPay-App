import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:intl_phone_field/country_picker_dialog.dart';
import 'package:crosspay/theme/colors.dart';
import 'package:intl_phone_field/countries.dart';
import 'package:intl_phone_field/phone_number.dart';

class CPPhoneInputField extends StatelessWidget {
  const CPPhoneInputField(
      {Key? key,
      required this.countryList,
      required this.phoneController,
      required this.onChanged,
      required this.onCountryChanged})
      : super(key: key);

  final List<Country> countryList;
  final TextEditingController phoneController;
  final Function(PhoneNumber phone) onChanged;
  final Function(Country country) onCountryChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
      child: IntlPhoneField(
        disableAutoFillHints: true,
        style: _defaultTextStyle(context, kNeutralColor),
        countries: countryList,
        dropdownTextStyle: _defaultTextStyle(context, kNeutralColor),
        pickerDialogStyle: PickerDialogStyle(
          backgroundColor: kWhiteColor,
          countryCodeStyle: _defaultTextStyle(context, kNeutralColor50),
          listTilePadding:
              const EdgeInsets.symmetric(vertical: 0, horizontal: 8),
          listTileDivider: Container(),
          countryNameStyle: _defaultTextStyle(context, kNeutralColor),
        ),
        dropdownIcon: const Icon(
          Icons.arrow_drop_down_rounded,
          size: 26,
          color: kNeutralColor50,
        ),
        cursorColor: kPrimaryColor,
        controller: phoneController,
        onChanged: (phone) {
          onChanged(phone);
        },
        onCountryChanged: (country) {
          onCountryChanged(country);
        },
        decoration: InputDecoration(
            hintText: 'Phone number',
            border: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(16)),
            fillColor: kInputBgColor,
            floatingLabelBehavior: FloatingLabelBehavior.never,
            filled: true,
            helperStyle: _defaultTextStyle(context, kNeutralColor50),
            hintStyle: _defaultTextStyle(context, kNeutralColor50)),
      ),
    );
  }

  TextStyle _defaultTextStyle(BuildContext context, Color color) {
    return Theme.of(context).textTheme.bodySmall!.copyWith(color: color);
  }
}
