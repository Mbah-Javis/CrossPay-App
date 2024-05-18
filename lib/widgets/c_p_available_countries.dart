import 'package:flutter/material.dart';
import 'package:crosspay/models/c_p_country_model.dart';
import 'c_p_available_country.dart';
import 'package:get/get.dart';
import 'package:crosspay/controllers/mobile_money_controller.dart';
import 'package:crosspay/widgets/c_p_loading_widget.dart';

class CPAvailableCountries extends StatefulWidget {
  const CPAvailableCountries({super.key, required this.isSendingMoney});

  final bool isSendingMoney;

  @override
  CPAvailableCountriesState createState() => CPAvailableCountriesState();
}

class CPAvailableCountriesState extends State<CPAvailableCountries> {
  var mobileMoneyController = Get.put(MobileMoneyController());

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30), topRight: Radius.circular(30))),
      child: FutureBuilder(
          future: mobileMoneyController.getAvailableCountries(),
          builder: (context, snapshot) {
            if (snapshot.connectionState != ConnectionState.done) {
              return const Center(child: CPLoadingWidget());
            }
            List<CPCountryModel>? countries = snapshot.data;
            return countries != null
                ? ListView.builder(
                    itemCount: countries.length,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return CPAvailableCountry(
                        country: countries[index],
                        isSendingMoney: widget.isSendingMoney,
                        onOptionSelected: (selectedOption) {
                          mobileMoneyController.onOptionSelected(
                              countries[index],
                              selectedOption,
                              widget.isSendingMoney);
                        },
                      );
                    })
                : _noCountriesFound();
          }),
    );
  }

  Widget _noCountriesFound() {
    return const Center(child: Text('No available countries found'));
  }
}
