import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';

import '../../extensions/extensions.dart';
import '../../models/sneaker.dart';
import 'latest_product.dart';
import 'product_card.dart';

class HomeWidget extends StatelessWidget {
  const HomeWidget({
    super.key,
    required Future<List<Sneaker>> male,
  }) : _male = male;

  final Future<List<Sneaker>> _male;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: context.screenSize.height * 0.4,
          child: FutureBuilder<List<Sneaker>>(
            future: _male,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const CircularProgressIndicator();
              } else if (snapshot.hasError) {
                return const Text('Error');
              } else {
                final male = snapshot.data;

                return ListView.builder(
                  itemCount: male!.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    final shoe = male[index];

                    return Padding(
                      padding: const EdgeInsets.all(8),
                      child: ProductCard(
                        price: shoe.price,
                        category: shoe.name,
                        id: shoe.id,
                        name: shoe.name,
                        image: shoe.imageUrl[0],
                      ),
                    );
                  },
                );
              }
            },
          ),
        ),
        const Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Latest Shoes',
                    style: TextStyle(fontSize: 24, color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                  Row(
                    children: [
                      Text(
                        'Show All',
                        style: TextStyle(fontSize: 22, color: Colors.black, fontWeight: FontWeight.w500),
                      ),
                      Icon(
                        AntDesign.caretright,
                        size: 20,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
        SizedBox(
          height: context.screenSize.height * 0.15,
          child: FutureBuilder<List<Sneaker>>(
            future: _male,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const CircularProgressIndicator();
              } else if (snapshot.hasError) {
                return const Text('Error');
              } else {
                final male = snapshot.data;

                return ListView.builder(
                  itemCount: male!.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    final shoe = male[index];

                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: LatestProduct(
                        image: shoe.imageUrl[1],
                      ),
                    );
                  },
                );
              }
            },
          ),
        ),
      ],
    );
  }
}
