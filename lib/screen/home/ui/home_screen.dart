import 'package:explorer_start_hack/screen/home/bloc/home_screen_bloc.dart';
import 'package:explorer_start_hack/screen/home/ui/home_loaded_screen.dart';
import 'package:explorer_start_hack/screen/home/ui/home_loading_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatefulWidget {
  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     appBar: AppBar(
  //       title: Text("SBB explorer"),
  //     ),
  //     body: ListScreenProvider(),
  //   );
  // }

  @override
  State<StatefulWidget> createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  final searchTextFieldController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("SBB explorer"),
      ),
      body: _homeScreenBody(),
    );
  }

  @override
  void initState() {
    super.initState();
    BlocProvider.of<HomeScreenBloc>(context).add(LoadLocationsEvent());
        // .add(GetSearchEvent(searchTextFieldController.text));
  }

  Widget _homeScreenBody() => Column(
        children: [
          _searchFieldWithFadeInAnimation(),
          BlocBuilder<HomeScreenBloc, HomeScreenBlocState>(
            builder: (context, state) {
              if(state is HomeScreenLoading) {
                return HomeLoadingScreen();
              } else if(state is HomeScreenLoaded) {
                return HomeLoadedScreen(state.locations);
              } else {
                return Container();
              }
            },
          )
        ],
      );

  Widget _searchFieldWithFadeInAnimation() => TweenAnimationBuilder(
        child: _searchField(),
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

  Widget _searchField() => TextField(
      onEditingComplete: () {
        _getSearch();
      },
      maxLength: 50,

      maxLengthEnforcement: MaxLengthEnforcement.enforced,
      controller: searchTextFieldController,
      decoration: InputDecoration(
        counter: Offstage(),
          fillColor: Colors.grey,
          border: InputBorder.none,
          prefixIcon: Icon(Icons.search),
          hintText: 'Search'));

  _getSearch() => BlocProvider.of<HomeScreenBloc>(context)
      .add(GetSearchEvent(searchTextFieldController.text));
}

class ListScreenProvider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => HomeScreenBloc(), child: ListScreen());
  }
}

class ListScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => ListScreenState();
}

final searchTextFieldController = TextEditingController();

class ListScreenState extends State<ListScreen> {
  /*
  ******************************************************************
Override method for stat initialization
  ******************************************************************
   */
  @override
  void initState() {
    super.initState();
    BlocProvider.of<HomeScreenBloc>(context)
        .add(GetSearchEvent(searchTextFieldController.text));
  }

  /*
  ******************************************************************
Override method for build
  ******************************************************************
   */
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(children: [
      buildSearchFieldWithFadeInAnimation(),
      builderListView() //kontener na listview, komunikat o bledzie lub ladowanie
    ]));
  }

  /*
  ******************************************************************
  method for sending data form Search Field to Event bloc
  ******************************************************************
   */
  _getSearch() {
    BlocProvider.of<HomeScreenBloc>(context)
        .add(GetSearchEvent(searchTextFieldController.text));
    print(searchTextFieldController.text);
  }

  /*
  ******************************************************************
  Widget Search Field + Animation
  ******************************************************************
   */
  Widget buildSearchFieldWithFadeInAnimation() => TweenAnimationBuilder(
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

  /*
  ******************************************************************
  Widget Search Field
  ******************************************************************
   */
  Widget buildSearchField() => TextField(
      onEditingComplete: () {
        _getSearch();
      },
      maxLength: 50,
      
      maxLengthEnforcement: MaxLengthEnforcement.enforced,
      controller: searchTextFieldController,
      decoration: InputDecoration(
        counterText: '',
          fillColor: Colors.grey,
          border: InputBorder.none,
          prefixIcon: Icon(Icons.search),
          hintText: 'Search'));

  /*
  ******************************************************************
  Widget List
  ******************************************************************
   */

  Widget builderListView() => Expanded(
          child: ListView(shrinkWrap: true, children: [
        builderListElement(),
        builderListElement(),
        builderListElement(),
        builderListElement()
      ]));

  /*
  ******************************************************************
  Widget Element Of List
  ******************************************************************
   */
  Widget builderListElement() => Padding(
      padding: EdgeInsets.only(top: 2, bottom: 2),
      child: Container(
          height: 50,
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(10)),
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

  /*
  ******************************************************************
  BLOCK BUILDER
  ******************************************************************
   */
  Widget buildBlockBuilder() => BlocBuilder(builder: (context, state) {
        if (state is HomeScreenLoading) {
          return ListScreen();
          //* Space for Loading widgets /\delete
        } else if (state is HomeScreenLoaded) {
          return ListScreen();

        } else {
          return ListScreen();
          //* Space for error widgets /\delete
        }
      });
}
