import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ProductTile extends StatefulWidget {
  const ProductTile({super.key, required this.image, required this.name, required this.price});

  final String image;
  final String name;
  final String price;

  @override
  State<ProductTile> createState() => _ProductTileState();
}

class _ProductTileState extends State<ProductTile> {
  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(16)),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CachedNetworkImage(
              imageUrl: widget.image,
              fit: BoxFit.fill,
            ),
            Container(
              padding: const EdgeInsets.only(top: 12),
              height: 70,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.name,
                    style: const TextStyle(fontSize: 20, color: Colors.black, fontWeight: FontWeight.w700, height: 1),
                  ),
                  Text(
                    widget.price,
                    style: const TextStyle(fontSize: 20, color: Colors.black, fontWeight: FontWeight.w700, height: 1),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
