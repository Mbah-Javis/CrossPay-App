import 'package:flutter/material.dart';
import 'package:crosspay/theme/colors.dart';
import 'package:crosspay/utils/c_p_spacer.dart';
import 'package:crosspay/utils/text_formatter.dart';
import 'package:crosspay/widgets/c_p_image.dart';
import 'package:crosspay/models/c_p_transaction.dart';
import 'package:crosspay/controllers/mobile_money_controller.dart';
import 'package:get/get.dart';

class CPTransactionWidget extends StatelessWidget {
  CPTransactionWidget({super.key, required this.transaction});

  final CPTransaction transaction;

  final momoController = Get.put(MobileMoneyController());

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.symmetric(vertical: 8),
      padding: const EdgeInsets.all(3),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          FutureBuilder(
              future: momoController.getAvailableCountries(),
              builder: (context, snapshot) {
                if (snapshot.connectionState != ConnectionState.done) {
                  return Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                        color: kWhiteColor,
                        borderRadius: BorderRadius.circular(100)),
                  );
                }
                var countryInfo = snapshot.data!.firstWhere((element) =>
                    element.country == transaction.meta?.receiverCountry);
                var option = countryInfo.paymentOptions?.firstWhere(
                    (element) => element.network == transaction.meta?.network);
                return Stack(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          color: kWhiteColor,
                          borderRadius: BorderRadius.circular(100)),
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(100),
                          child: CPImage(imageUrl: option!.logo)),
                    ),
                    Positioned(
                        bottom: 0,
                        right: 0,
                        child: CPImage(
                            imageUrl: countryInfo.flag!, height: 17, width: 17))
                  ],
                );
              }),
          CPSpacer().width(10),
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('${transaction.meta?.receiverName}'),
                  Text(
                    TextFormatter()
                        .formatDateWithTime('${transaction.meta?.dateCreated}'),
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                        color: kPrimaryColor.withOpacity(0.4), fontSize: 9),
                  ),
                ],
              ),
              CPSpacer().height(2),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '${transaction.deliveredStatus}',
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                        color: getColor('${transaction.deliveredStatus}'),
                        fontSize: 11),
                  ),
                  Text(
                    TextFormatter().formatCurrency(
                        '${transaction.meta?.currency}',
                        transaction.amount!.toDouble()),
                    style: Theme.of(context).textTheme.titleSmall!.copyWith(
                        color: kPrimaryColor, fontWeight: FontWeight.w500),
                  ),
                ],
              ),
              Text(
                '${transaction.meta?.networkName}',
                style: Theme.of(context).textTheme.bodySmall!.copyWith(
                    color: kPrimaryColor.withOpacity(0.4), fontSize: 9),
              ),
            ],
          ))
        ],
      ),
    );
  }

  Color getColor(String status) {
    switch (status) {
      case "pending":
        return kWarningColor;
      case "inprogress":
        return kLightBlueColor;
      case "completed":
        return kGreenColor;
      case "failed":
        return kErrorColor;
      default:
        return kWarningColor;
    }
  }
}
