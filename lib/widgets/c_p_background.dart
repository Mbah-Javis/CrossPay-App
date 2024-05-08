import 'package:flutter/material.dart';

class CPBackground extends StatelessWidget {
  const CPBackground({Key? key, required this.assetName, required this.child})
      : super(key: key);

  final String assetName;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      decoration: BoxDecoration(
          image:
              DecorationImage(fit: BoxFit.cover, image: AssetImage(assetName))),
      child: child,
    );
  }
}
