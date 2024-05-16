import 'package:flutter/material.dart';
import 'package:crosspay/theme/colors.dart';
import 'package:crosspay/widgets/c_p_loading_widget.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:crosspay/utils/c_p_spacer.dart';
import 'package:crosspay/utils/text_formatter.dart';

class CPTransactionWidget extends StatelessWidget {
  const CPTransactionWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.symmetric(vertical: 8),
      padding: EdgeInsets.all(3),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                    color: kWhiteColor,
                    borderRadius: BorderRadius.circular(100),
                    border: Border.all(color: kPrimaryColor, width: 2)),
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: CachedNetworkImage(
                      imageUrl:
                          'https://ik.imagekit.io/tp/20220131-mtn-momo-ghana-logo.png',
                      fit: BoxFit.cover,
                      height: 40,
                      width: 40,
                      placeholder: (context, value) {
                        return CPLoadingWidget();
                      },
                    )),
              ),
              Positioned(
                  bottom: 0,
                  right: 0,
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: CachedNetworkImage(
                        imageUrl:
                            'https://upload.wikimedia.org/wikipedia/commons/thumb/4/4f/Flag_of_Cameroon.svg/1280px-Flag_of_Cameroon.svg.png',
                        fit: BoxFit.cover,
                        height: 17,
                        width: 17,
                        placeholder: (context, value) {
                          return CPLoadingWidget();
                        },
                      )))
            ],
          ),
          CPSpacer().width(10),
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Mbah Javis'),
                  Text(
                    'May 16, 07:07 PM',
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
                    'Completed',
                    style: Theme.of(context)
                        .textTheme
                        .bodySmall!
                        .copyWith(color: kGreenColor, fontSize: 11),
                  ),
                  Text(
                    TextFormatter().formatCurrency('XAF', 20000),
                    style: Theme.of(context).textTheme.titleSmall!.copyWith(
                        color: kPrimaryColor, fontWeight: FontWeight.w500),
                  ),
                ],
              ),
              Text(
                'MTN Mobile Money',
                style: Theme.of(context).textTheme.bodySmall!.copyWith(
                    color: kPrimaryColor.withOpacity(0.4), fontSize: 9),
              ),
            ],
          ))
        ],
      ),
    );
  }
}
