import 'package:flutter/material.dart';
import 'c_p_available_country.dart';

class CPAvailableCountries extends StatefulWidget {
  const CPAvailableCountries({Key? key, required this.isSendingMoney})
      : super(key: key);

  final bool isSendingMoney;

  @override
  _CPAvailableCountriesState createState() => _CPAvailableCountriesState();
}

class _CPAvailableCountriesState extends State<CPAvailableCountries> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30), topRight: Radius.circular(30))),
      child: SingleChildScrollView(
        child: Column(
          children: [
            CPAvailableCountry(),
            CPAvailableCountry(),
          ],
        ),
      ),
    );
  }
}
