import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:crosspay/theme/colors.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:crosspay/widgets/c_p_loading_widget.dart';
import 'package:crosspay/utils/c_p_spacer.dart';
import 'package:crosspay/models/c_p_country_model.dart';
import 'package:crosspay/utils/utils.dart';

class CPAvailableCountry extends StatefulWidget {
  const CPAvailableCountry(
      {Key? key,
      required this.country,
      required this.isSendingMoney,
      required this.onOptionSelected})
      : super(key: key);

  final CPCountryModel country;
  final bool isSendingMoney;
  final Function(PaymentOption) onOptionSelected;
  @override
  _CPAvailableCountryState createState() => _CPAvailableCountryState();
}

class _CPAvailableCountryState extends State<CPAvailableCountry> {
  bool showOptions = false;

  void updateShowOptions() {
    setState(() {
      showOptions = !showOptions;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      padding: EdgeInsets.symmetric(vertical: 12, horizontal: 15),
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
                    ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        child: CachedNetworkImage(
                          imageUrl: '${widget.country.flag}',
                          fit: BoxFit.cover,
                          height: 35,
                          width: 35,
                          placeholder: (context, value) {
                            return CPLoadingWidget();
                          },
                        )),
                    CPSpacer().width(15),
                    Text(
                      getCountry(widget.country.country!),
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                  ],
                ),
                Icon(
                  showOptions
                      ? CupertinoIcons.arrowtriangle_up_circle
                      : CupertinoIcons.arrowtriangle_down_circle,
                  color: kNeutralColor50,
                )
              ],
            ),
          ),
          showOptions ? Divider() : Container(),
          showOptions ? _buildOptions() : Container()
        ],
      ),
    );
  }

  Widget _buildOptions() {
    return Container(
      margin: EdgeInsets.only(left: 15),
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
        margin: EdgeInsets.symmetric(vertical: 8),
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 7),
        decoration: BoxDecoration(
            color: kInputBgColor, borderRadius: BorderRadius.circular(15)),
        child: Row(
          children: [
            Container(
              decoration: BoxDecoration(
                  color: kWhiteColor,
                  border: Border.all(color: kWhiteColor, width: 2),
                  borderRadius: BorderRadius.circular(100)),
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(100),
                  child: CachedNetworkImage(
                    imageUrl: '${paymentOption.logo}',
                    fit: BoxFit.cover,
                    height: 30,
                    width: 30,
                    placeholder: (context, value) {
                      return CPLoadingWidget();
                    },
                  )),
            ),
            CPSpacer().width(15),
            Text(
              widget.isSendingMoney
                  ? '${paymentOption.name}'
                  : '${paymentOption.network}',
              style: Theme.of(context).textTheme.titleSmall,
            ),
          ],
        ),
      ),
    );
  }
}
