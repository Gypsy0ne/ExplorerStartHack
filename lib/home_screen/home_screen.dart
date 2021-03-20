import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("SBB explorer"),
        ),
        body: Column(children:
            [buildSearchField(),

        ListView(


        )]));
  }
}


Widget buildSearchFieldWithFadeInAnimation() =>
    TweenAnimationBuilder(
      child: buildSearchField(),
      tween: Tween<double>(begin: 0, end: 1),
      duration: Duration(seconds: 1),
      builder: (BuildContext context, double _value, Widget child) {
        return Opacity(
          opacity: _value,
          child: Padding(
              padding: EdgeInsets.only(top: _value * 20), child: child),
        );
      },
    );

Widget buildSearchField() =>
  TextField(

      maxLength: 20,
      maxLengthEnforcement: MaxLengthEnforcement.enforced,
      decoration: InputDecoration(
          border: InputBorder.none,
          prefixIcon: Icon(Icons.search),
          hintText: 'Search'));

