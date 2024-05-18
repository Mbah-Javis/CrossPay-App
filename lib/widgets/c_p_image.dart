import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:crosspay/widgets/c_p_loading_widget.dart';

class CPImage extends StatelessWidget {
  const CPImage(
      {super.key,
      required this.imageUrl,
      this.height,
      this.width,
      this.radius});

  final String imageUrl;
  final double? height;
  final double? width;
  final double? radius;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
        borderRadius: BorderRadius.circular(radius ?? 100),
        child: CachedNetworkImage(
          imageUrl: imageUrl,
          fit: BoxFit.cover,
          height: height ?? 40,
          width: width ?? 40,
          placeholder: (context, value) {
            return const Center(
              child: CPLoadingWidget(),
            );
          },
        ));
  }
}
