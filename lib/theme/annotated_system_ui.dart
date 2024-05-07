import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AnnotatedSystemUI extends StatelessWidget {
  final Widget child;

  const AnnotatedSystemUI({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Theme.of(context).brightness,
          systemNavigationBarColor: Theme.of(context).scaffoldBackgroundColor,
          systemNavigationBarIconBrightness: Theme.of(context).brightness,
        ),
        child: child);
  }
}
