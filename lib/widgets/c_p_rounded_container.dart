import 'package:flutter/material.dart';

class CPRoundedContainer extends StatelessWidget {
  const CPRoundedContainer({Key? key, required this.child, this.padding})
      : super(key: key);

  final Widget child;
  final EdgeInsets? padding;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: padding ?? EdgeInsets.symmetric(vertical: 20, horizontal: 15),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          color: Theme.of(context).scaffoldBackgroundColor),
      child: child,
    );
  }
}
