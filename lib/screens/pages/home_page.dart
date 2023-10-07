import 'package:flutter/material.dart';

import '../../extensions/extensions.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  late final TabController _tabController = TabController(length: 3, vsync: this);

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
              padding: EdgeInsets.only(top: context.screenSize.height * 0.25),
              child: TabBarView(
                controller: _tabController,
                children: [
                  Column(
                    children: [
                      Container(
                        height: context.screenSize.height * 0.4,
                        decoration: const BoxDecoration(color: Colors.blueAccent),
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
