import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

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
        body: Center(
            child: Column(children: [
          buildSearchFieldWithFadeInAnimation(),
          builderListView()
        ])));
  }
}

Widget buildSearchFieldWithFadeInAnimation() => TweenAnimationBuilder(
      child: buildSearchField(),
      tween: Tween<double>(begin: 0, end: 1),
      duration: Duration(seconds: 1),
      builder: (BuildContext context, double _value, Widget child) {
        return Opacity(
          opacity: _value,
          child:
              Padding(padding: EdgeInsets.only(top: _value * 20), child: child),
        );
      },
    );

Widget buildSearchField() => TextField(
    maxLength: 50,
    maxLengthEnforcement: MaxLengthEnforcement.enforced,
    decoration: InputDecoration(
        fillColor: Colors.grey,
        border: InputBorder.none,
        prefixIcon: Icon(Icons.search),
        hintText: 'Search'));

Widget builderListView() => Expanded( child:ListView(
    shrinkWrap: true,
    children: [
      builderListElement(),
      builderListElement(),
      builderListElement(),
      builderListElement()
    ]));

Widget builderListElement() => Padding(
    padding: EdgeInsets.only(top: 2, bottom: 2),
    child: Container(
        height: 50,
        decoration:
        BoxDecoration(
          color: Colors.white,
            boxShadow: <BoxShadow>[
          BoxShadow(blurRadius: 8, color: Colors.black45)
        ], borderRadius: BorderRadius.circular(10)),
        child: Row(
          children: [
            Text(
              'City Name',
              style: GoogleFonts.cormorantUnicase(
                textStyle: TextStyle(

                  fontSize: 30,
                  shadows: <Shadow>[
                    Shadow(blurRadius: 2.0, color: Colors.black),
                  ],
                ),
              ),
            ),
            Spacer(),
            Text(
              '12',
              style: GoogleFonts.cormorantUnicase(
                textStyle: TextStyle(
                  fontSize: 28,
                  shadows: <Shadow>[
                    Shadow(blurRadius: 2.0, color: Colors.black),
                  ],
                ),
              ),
            ),
          ],
        )));
