import 'package:explorer_start_hack/screen/details/bloc/details_screen_bloc.dart';
import 'dart:io';

import 'package:explorer_start_hack/http_overrides.dart';
import 'package:explorer_start_hack/screen/home/bloc/home_screen_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'screen/home/ui/home_screen.dart';

void main() {
  HttpOverrides.global = new SbbHttpOverrides();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: MultiBlocProvider(providers: [
 BlocProvider<HomeScreenBloc>(
      create: (BuildContext context) => HomeScreenBloc(),),
   BlocProvider<DetailsScreenBloc>(
      create: (BuildContext context) => DetailsScreenBloc(),
    )],
            child: HomeScreen())

    );
  }
}
