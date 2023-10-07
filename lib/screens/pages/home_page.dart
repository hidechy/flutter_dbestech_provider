import 'package:flutter/material.dart';

import '../../extensions/extensions.dart';
import '../../models/sneaker.dart';
import '../../services/helper.dart';
import '../components/home_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  late final TabController _tabController = TabController(length: 3, vsync: this);

  late Future<List<Sneaker>> _male;
  late Future<List<Sneaker>> _female;
  late Future<List<Sneaker>> _kids;

  ///
  void getMale() {
    _male = Helper().getMaleSneakers();
  }

  ///
  void getFemale() {
    _female = Helper().getFemaleSneakers();
  }

  ///
  void getKids() {
    _kids = Helper().getKidsSneakers();
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
                top: context.screenSize.height * 0.23,
                left: 12,
                right: 12,
              ),
              child: TabBarView(
                controller: _tabController,
                children: [
                  HomeWidget(male: _male),
                  HomeWidget(male: _female),
                  HomeWidget(male: _kids),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
