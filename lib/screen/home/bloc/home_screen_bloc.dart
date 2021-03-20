import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:explorer_start_hack/screen/home/ui/home_screen.dart';

part 'home_screen_event.dart';
part 'home_screen_state.dart';

class HomeScreenBloc extends Bloc<HomeScreenEvent, HomeScreenState> {
  HomeScreenBloc() : super(HomeScreenInitial());

  @override
  Stream<HomeScreenState> mapEventToState(
      HomeScreenEvent event,
      ) async* {
    // yield HomeScreenLoading();

    if (event is GetSearchEvent)
    {


    }

  }
}
