import 'package:explorer_start_hack/screen/details_screen/ui/details_screen.dart';
import 'package:explorer_start_hack/screen/home/bloc/home_screen_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'screen/home/ui/home_screen.dart';

void main() {
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
        home: DetailsScreen());

    /* BlocProvider(
        create: (context) => HomeScreenBloc(),
        child: HomeScreen()
      )
    ); */
  }
}
