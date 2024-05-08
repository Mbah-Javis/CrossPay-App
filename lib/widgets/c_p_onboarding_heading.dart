import 'package:flutter/material.dart';
import 'package:crosspay/theme/colors.dart';
import 'package:crosspay/widgets/buttons/c_p_back_button.dart';

class CPOnboardingHeading extends StatelessWidget {
  const CPOnboardingHeading({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CPBackButton(),
        SizedBox(
          height: 30,
        ),
        Container(
          padding: EdgeInsets.symmetric(vertical: 8, horizontal: 30),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15), color: kWhiteColor),
          child: Text(
            title,
            style: Theme.of(context)
                .textTheme
                .titleLarge!
                .copyWith(color: kBlackColor, fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }
}
