import 'package:flutter/material.dart';
import 'package:crosspay/theme/colors.dart';

class CPSendButton extends StatelessWidget {
  const CPSendButton(
      {Key? key,
      required this.title,
      required this.backgroundColor,
      required this.icon,
      required this.onClick})
      : super(key: key);

  final String title;
  final Color backgroundColor;
  final Widget icon;
  final VoidCallback onClick;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onClick,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25), color: backgroundColor),
        constraints: BoxConstraints(minWidth: 160),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            icon,
            SizedBox(width: 2),
            Text(title,
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: kPrimaryColor, fontWeight: FontWeight.w600)),
          ],
        ),
      ),
    );
  }
}
