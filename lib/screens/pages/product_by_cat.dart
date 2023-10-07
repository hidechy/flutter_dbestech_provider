import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';

import '../../extensions/extensions.dart';
import '../../models/sneaker.dart';
import '../../services/helper.dart';

class ProductByCat extends StatefulWidget {
  const ProductByCat({super.key});

  @override
  State<ProductByCat> createState() => _ProductByCatState();
}

class _ProductByCatState extends State<ProductByCat> with TickerProviderStateMixin {
  late final TabController _tabController = TabController(length: 3, vsync: this);

  late Future<List<Sneaker>> _male;

  // late Future<List<Sneaker>> _female;
  // late Future<List<Sneaker>> _kids;
  //
  //
  //

  ///
  void getMale() {
    _male = Helper().getMaleSneakers();
  }

  // ///
  // void getFemale() {
  //   _female = Helper().getFemaleSneakers();
  // }
  //
  // ///
  // void getKids() {
  //   _kids = Helper().getKidsSneakers();
  // }

  ///
  @override
  void initState() {
    super.initState();
    getMale();
    // getFemale();
    // getKids();
    //
    //
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
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(6, 12, 16, 18),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: const Icon(
                            AntDesign.close,
                            color: Colors.white,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {},
                          child: const Icon(
                            FontAwesome.sliders,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
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
            Padding(
              padding: EdgeInsets.only(
                top: context.screenSize.height * 0.2,
                left: 16,
                right: 16,
              ),
              child: TabBarView(
                controller: _tabController,
                children: [
                  FutureBuilder<List<Sneaker>>(
                    future: _male,
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const CircularProgressIndicator();
                      } else if (snapshot.hasError) {
                        return const Text('Error');
                      } else {
                        // final male = snapshot.data;
                        //
                        //

                        return StaggeredGrid.count(
                          crossAxisCount: 4,
                          mainAxisSpacing: 4,
                          crossAxisSpacing: 4,
                          children: const [
                            StaggeredGridTile.count(
                              crossAxisCellCount: 2,
                              mainAxisCellCount: 2,
                              child: _SampleTile(Colors.green),
                            ),
                            StaggeredGridTile.count(
                              crossAxisCellCount: 2,
                              mainAxisCellCount: 1,
                              child: _SampleTile(Colors.redAccent),
                            ),
                            StaggeredGridTile.count(
                              crossAxisCellCount: 1,
                              mainAxisCellCount: 1,
                              child: _SampleTile(Colors.purpleAccent),
                            ),
                            StaggeredGridTile.count(
                              crossAxisCellCount: 1,
                              mainAxisCellCount: 1,
                              child: _SampleTile(Colors.pinkAccent),
                            ),
                            StaggeredGridTile.count(
                              crossAxisCellCount: 4,
                              mainAxisCellCount: 2,
                              child: _SampleTile(Colors.blue),
                            ),
                          ],
                        );
                      }
                    },
                  ),
                  Container(
                    height: 500,
                    width: 300,
                    color: Colors.blueAccent,
                  ),
                  Container(
                    height: 500,
                    width: 300,
                    color: Colors.yellowAccent,
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

class _SampleTile extends StatelessWidget {
  const _SampleTile(this.backgroundColor);

  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: backgroundColor,
      child: InkWell(
        onTap: () {},
        child: const Center(
          child: Padding(
            padding: EdgeInsets.all(4),
          ),
        ),
      ),
    );
  }
}
