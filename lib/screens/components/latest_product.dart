import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../extensions/extensions.dart';

class LatestProduct extends StatelessWidget {
  const LatestProduct({super.key, required this.image});

  final String image;

  ///
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(16)),
        boxShadow: [
          BoxShadow(color: Colors.black38, spreadRadius: 1, blurRadius: 0.8, offset: Offset(0, 1)),
        ],
      ),
      height: context.screenSize.height * 0.15,
      width: context.screenSize.width * 0.3,
      child: CachedNetworkImage(
        imageUrl: image,
      ),
    );
  }
}
