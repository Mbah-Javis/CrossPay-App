import 'package:flutter/material.dart';
import 'package:crosspay/theme/colors.dart';
import 'package:crosspay/widgets/c_p_loading_widget.dart';

class CrossPayButton extends StatelessWidget {
  const CrossPayButton(
      {Key? key,
      required this.title,
      required this.onClick,
      this.color,
      this.borderColor,
      this.width,
      this.height,
      this.titleColor,
      required this.loading})
      : super(key: key);

  final String title;
  final VoidCallback onClick;
  final Color? color;
  final Color? borderColor;
  final double? width;
  final double? height;
  final Color? titleColor;
  final bool loading;

  @override
  Widget build(BuildContext context) {
    return loading
        ? CPLoadingWidget()
        : ElevatedButton(
            style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  side: BorderSide(color: borderColor ?? kPrimaryColor),
                  borderRadius: BorderRadius.circular(15.0),
                ),
                padding: const EdgeInsets.all(0.0),
                elevation: 0,
                fixedSize: Size(
                    width ?? MediaQuery.of(context).size.width, height ?? 52),
                backgroundColor: color ?? kPrimaryColor),
            onPressed: onClick,
            child: Text(title,
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium!
                    .copyWith(color: titleColor ?? kWhiteColor)),
          );
  }
}
