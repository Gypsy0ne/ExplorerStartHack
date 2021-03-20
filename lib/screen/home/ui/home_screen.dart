import 'package:explorer_start_hack/screen/home/bloc/home_screen_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:keyboard_visibility/keyboard_visibility.dart';

class HomeScreenProvider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => HomeScreenBloc(), child: HomeScreen());
  }
}

class HomeScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => HomeScreenState();
}

final searchTextFieldController = TextEditingController();

class HomeScreenState extends State<HomeScreen> {
  _getSearch() {
    BlocProvider.of<HomeScreenBloc>(context)
        .add(GetSearchEvent(searchTextFieldController.text));
  }
  @override
  void initState() {
    super.initState();
    BlocProvider.of<HomeScreenBloc>(context)
        .add(GetSearchEvent(searchTextFieldController.text));
  }



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
  @override void initState() {
    super.initState();
    KeyboardVisibilityNotification().addNewListener(
      onChange: (bool visible) {
        _getSearch();
      },
    );
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
              maxLength: 50,
              maxLengthEnforcement: MaxLengthEnforcement.enforced,
       onEditingComplete: () {
         _getSearch();},

controller: searchTextFieldController,
              decoration: InputDecoration(
                  fillColor: Colors.grey,
                  border: InputBorder.none,
                  prefixIcon: Icon(Icons.search),
                  hintText: 'Search'));
  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    searchTextFieldController.dispose();
    super.dispose();
  }

  Widget builderListView() =>
      Expanded(
          child: ListView(shrinkWrap: true, children: [
            builderListElement(),
            builderListElement(),
            builderListElement(),
            builderListElement()
          ]));

  Widget builderListElement() =>
      Padding(
          padding: EdgeInsets.only(top: 2, bottom: 2),
          child: Container(
              height: 50,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10)),
              child: Row(
                children: [
                  Text(
                    'City Name',
                    style: GoogleFonts.ubuntu(
                      textStyle: TextStyle(
                        fontSize: 30,
                      ),
                    ),
                  ),
                  Spacer(),
                  Text(
                    '12',
                    style: GoogleFonts.ubuntu(
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

  Widget buildBlockBuilder() =>
      BlocBuilder(builder: (context, state)
  {
  return HomeScreen();
  });

}