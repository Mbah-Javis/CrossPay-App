import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:crosspay/theme/colors.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:crosspay/widgets/c_p_loading_widget.dart';
import 'package:crosspay/utils/c_p_spacer.dart';

class CPAvailableCountry extends StatefulWidget {
  const CPAvailableCountry({Key? key}) : super(key: key);

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
                          imageUrl:
                              'https://upload.wikimedia.org/wikipedia/commons/thumb/4/4f/Flag_of_Cameroon.svg/1280px-Flag_of_Cameroon.svg.png',
                          fit: BoxFit.cover,
                          height: 35,
                          width: 35,
                          placeholder: (context, value) {
                            return CPLoadingWidget();
                          },
                        )),
                    CPSpacer().width(15),
                    Text(
                      'Cameroon',
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
        children: [
          _mobileMoneyOption(),
          _mobileMoneyOption(),
        ],
      ),
    );
  }

  Widget _mobileMoneyOption() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8),
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 7),
      decoration: BoxDecoration(
          color: kInputBgColor, borderRadius: BorderRadius.circular(15)),
      child: Row(
        children: [
          ClipRRect(
              borderRadius: BorderRadius.circular(100),
              child: CachedNetworkImage(
                imageUrl:
                    'https://mir-s3-cdn-cf.behance.net/projects/404/44804e195504705.Y3JvcCw4MDgsNjMyLDAsMA.jpg',
                fit: BoxFit.cover,
                height: 30,
                width: 30,
                placeholder: (context, value) {
                  return CPLoadingWidget();
                },
              )),
          CPSpacer().width(15),
          Text(
            'MTN Mobile Money',
            style: Theme.of(context).textTheme.titleSmall,
          ),
        ],
      ),
    );
  }
}
