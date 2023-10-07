import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';

import '../../extensions/extensions.dart';
import '../../models/sneaker.dart';
import '../../services/helper.dart';
import '../components/product_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  late final TabController _tabController = TabController(length: 3, vsync: this);

  late Future<List<Sneaker>> _male;

  // late Future<List<Sneaker>> _female;
  // late Future<List<Sneaker>> _kids;
  //
  //

  ///
  void getMale() {
    _male = Helper().getMaleSneakers();
  }

  ///
  void getFemale() {
    _male = Helper().getFemaleSneakers();
  }

  ///
  void getKids() {
    _male = Helper().getKidsSneakers();
  }

  ///
  @override
  void initState() {
    super.initState();
    getMale();
    getFemale();
    getKids();
  }

  ///
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: context.screenSize.height,
        child: Stack(
          children: [
            Container(
              padding: const EdgeInsets.fromLTRB(16, 45, 0, 0),
              width: context.screenSize.width,
              height: context.screenSize.height * 0.4,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/top_image.png'),
                  fit: BoxFit.fill,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 8, bottom: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Athletics Shoes',
                      style: TextStyle(fontSize: 42, color: Colors.white, fontWeight: FontWeight.bold, height: 1.5),
                    ),
                    const Text(
                      'Collection',
                      style: TextStyle(fontSize: 42, color: Colors.white, fontWeight: FontWeight.bold, height: 1.2),
                    ),
                    TabBar(
                      indicatorSize: TabBarIndicatorSize.label,
                      indicatorColor: Colors.transparent,
                      controller: _tabController,
                      isScrollable: true,
                      labelColor: Colors.white,
                      labelStyle: const TextStyle(fontSize: 24, color: Colors.white, fontWeight: FontWeight.bold),
                      unselectedLabelColor: Colors.grey.withOpacity(0.3),
                      tabs: const [Tab(text: 'Men Shoes'), Tab(text: 'Woen Shoes'), Tab(text: 'Kids Shoes')],
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                top: context.screenSize.height * 0.25,
                left: 12,
                right: 12,
              ),
              child: TabBarView(
                controller: _tabController,
                children: [
                  Column(
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
                        child: ListView.builder(
                          itemCount: 6,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.all(8),
                              child: Container(
                                decoration: const BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.all(Radius.circular(16)),
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.black38, spreadRadius: 1, blurRadius: 0.8, offset: Offset(0, 1)),
                                  ],
                                ),
                                height: context.screenSize.height * 0.15,
                                width: context.screenSize.width * 0.3,
                                child: CachedNetworkImage(
                                  imageUrl:
                                      'https://d326fntlu7tb1e.cloudfront.net/uploads/710d020f-2da8-4e9e-8cff-0c8f24581488-GV6674.webp',
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Container(
                        height: context.screenSize.height * 0.4,
                        decoration: const BoxDecoration(color: Colors.redAccent),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Container(
                        height: context.screenSize.height * 0.4,
                        decoration: const BoxDecoration(color: Colors.amber),
                      ),
                    ],
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
