import 'package:flutter/material.dart';

class CPBackground extends StatelessWidget {
  const CPBackground(
      {super.key, required this.assetName, required this.child, this.fit});

  final String assetName;
  final Widget child;
  final BoxFit? fit;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      decoration: BoxDecoration(
          image: DecorationImage(
              fit: fit ?? BoxFit.cover, image: AssetImage(assetName))),
      child: child,
    );
  }
}
