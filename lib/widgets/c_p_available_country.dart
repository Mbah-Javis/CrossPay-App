import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:crosspay/theme/colors.dart';
import 'package:crosspay/utils/c_p_spacer.dart';
import 'package:crosspay/models/c_p_country_model.dart';
import 'package:crosspay/utils/utils.dart';
import 'c_p_image.dart';

class CPAvailableCountry extends StatefulWidget {
  const CPAvailableCountry(
      {super.key,
      required this.country,
      required this.isSendingMoney,
      required this.onOptionSelected});

  final CPCountryModel country;
  final bool isSendingMoney;
  final Function(PaymentOption) onOptionSelected;
  @override
  CPAvailableCountryState createState() => CPAvailableCountryState();
}

class CPAvailableCountryState extends State<CPAvailableCountry> {
  bool showOptions = false;

  void updateShowOptions() {
    setState(() {
      showOptions = !showOptions;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 15),
      decoration: BoxDecoration(
          color: kWhiteColor, borderRadius: BorderRadius.circular(20)),
      child: Column(
        children: [
          GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: () {
              updateShowOptions();
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    CPImage(
                        imageUrl: '${widget.country.flag}',
                        height: 35,
                        width: 35),
                    CPSpacer().width(15),
                    Text(
                      getCountry(widget.country.country!),
                      style: Theme.of(context)
                          .textTheme
                          .bodyLarge!
                          .copyWith(fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
                Icon(
                  showOptions
                      ? CupertinoIcons.arrowtriangle_up_circle
                      : CupertinoIcons.arrowtriangle_down_circle,
                  color: Theme.of(context).primaryColor.withOpacity(0.3),
                )
              ],
            ),
          ),
          showOptions
              ? Divider(
                  color: Theme.of(context).primaryColor.withOpacity(0.3),
                )
              : Container(),
          showOptions ? _buildOptions() : Container()
        ],
      ),
    );
  }

  Widget _buildOptions() {
    return Container(
      margin: const EdgeInsets.only(left: 15),
      child: Column(
        children: List.generate(
            widget.country!.paymentOptions!.length!,
            (index) =>
                _mobileMoneyOption(widget.country.paymentOptions![index])),
      ),
    );
  }

  Widget _mobileMoneyOption(PaymentOption paymentOption) {
    return InkWell(
      onTap: () {
        widget.onOptionSelected(paymentOption);
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 8),
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 7),
        decoration: BoxDecoration(
            color: kInputBgColor, borderRadius: BorderRadius.circular(15)),
        child: Row(
          children: [
            Container(
              decoration: BoxDecoration(
                  color: kWhiteColor,
                  border: Border.all(color: kWhiteColor, width: 2),
                  borderRadius: BorderRadius.circular(100)),
              child:
                  CPImage(imageUrl: paymentOption.logo, height: 30, width: 30),
            ),
            CPSpacer().width(15),
            Text(
              widget.isSendingMoney
                  ? paymentOption.name
                  : paymentOption.network,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ],
        ),
      ),
    );
  }
}
