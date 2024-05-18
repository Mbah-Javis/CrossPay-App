import 'package:flutter/material.dart';
import 'package:crosspay/theme/colors.dart';
import 'package:crosspay/widgets/buttons/c_p_back_button.dart';

class CPOnboardingHeading extends StatelessWidget {
  const CPOnboardingHeading({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const CPBackButton(),
        const SizedBox(
          height: 30,
        ),
        Container(
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 30),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15), color: kWhiteColor),
          child: Text(
            title,
            style: Theme.of(context)
                .textTheme
                .titleMedium!
                .copyWith(color: kBlackColor),
          ),
        ),
      ],
    );
  }
}
