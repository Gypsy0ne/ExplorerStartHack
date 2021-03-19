import 'package:explorer_poc/collection/collection_view.dart';
import 'package:explorer_poc/nearby/nearby_view.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        bottom: _homeTabBar(),
        title: Text("Explorer PoC"),
      ),
      body: _homeTabBarView(),
    );
  }

  Widget _homeTabBar() {
    return TabBar(
      tabs: [
        Tab(
          text: "Nearby",
        ),
        Tab(
          text: "Collection",
        )
      ],
    );
  }

  Widget _homeTabBarView() {
    return TabBarView(physics: NeverScrollableScrollPhysics(),children: [NearbyScreen(), CollectionScreen()]);
  }
}
