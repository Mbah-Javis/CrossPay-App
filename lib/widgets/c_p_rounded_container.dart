import 'package:flutter/material.dart';

class CPRoundedContainer extends StatelessWidget {
  const CPRoundedContainer({super.key, required this.child, this.padding});

  final Widget child;
  final EdgeInsets? padding;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding:
          padding ?? const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          color: Theme.of(context).scaffoldBackgroundColor),
      child: child,
    );
  }
}
