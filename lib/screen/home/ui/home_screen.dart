import 'package:explorer_start_hack/screen/home/bloc/home_screen_bloc.dart';
import 'package:explorer_start_hack/screen/home/ui/home_loaded_screen.dart';
import 'package:explorer_start_hack/screen/home/ui/home_loading_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatefulWidget {
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
        backgroundColor: Colors.redAccent,
      ),
      body: _homeScreenBody(),
    );
  }

  @override
  void initState() {
    super.initState();
    BlocProvider.of<HomeScreenBloc>(context).add(LoadLocationsEvent());
  }

  Widget _homeScreenBody() => Column(
        children: [
          _searchFieldWithFadeInAnimation(),
          BlocBuilder<HomeScreenBloc, HomeScreenBlocState>(
            builder: (context, state) {
              if (state is HomeScreenLoading) {
                return HomeLoadingScreen();
              } else if (state is HomeScreenLoaded) {
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
        FocusScope.of(context).unfocus();
      },
      textInputAction: TextInputAction.next,
      maxLength: 50,
      maxLengthEnforcement: MaxLengthEnforcement.enforced,
      controller: searchTextFieldController,
      decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
            borderRadius: BorderRadius.circular(16),
          ),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
            borderRadius: BorderRadius.circular(16),
          ),
        filled: true,
          counter: Offstage(),
          fillColor: Colors.white,
          border: InputBorder.none,
          prefixIcon: Icon(Icons.search),
          hintText: 'Search'));

  _getSearch() => BlocProvider.of<HomeScreenBloc>(context)
      .add(GetSearchEvent(searchTextFieldController.text));
}
