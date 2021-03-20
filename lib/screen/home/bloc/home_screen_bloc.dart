import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:explorer_start_hack/model/location_dto.dart';
import 'package:explorer_start_hack/repository/location_repository.dart';

part 'home_screen_event.dart';

part 'home_screen_state.dart';

class HomeScreenBloc extends Bloc<HomeScreenEvent, HomeScreenBlocState> {
  HomeScreenBloc() : super(HomeScreenLoading());

  // TODO inject it
  final LocationRepository _locationRepository = LocationRepository();

  @override
  Stream<HomeScreenBlocState> mapEventToState(
    HomeScreenEvent event,
  ) async* {
    yield HomeScreenLoading();

    if (event is GetSearchEvent) {
      print(event.searchText );
      final locations = await _locationRepository.getLocations();
      // TODO implement filtering
      yield HomeScreenLoaded(locations);
    }
  }
}

