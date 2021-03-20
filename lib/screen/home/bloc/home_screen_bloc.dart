import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:explorer_start_hack/model/location_dto.dart';
import 'package:explorer_start_hack/repository/location_repository.dart';

part 'home_screen_event.dart';

part 'home_screen_state.dart';

class HomeScreenBloc extends Bloc<HomeScreenEvent, HomeScreenBlocState> {
  HomeScreenBloc() : super(HomeScreenInitial());

  // TODO inject it
  final LocationRepository _locationRepository = LocationRepository();

  @override
  Stream<HomeScreenBlocState> mapEventToState(
    HomeScreenEvent event,
  ) async* {
    if (event is GetSearchEvent) {
      yield* _onSearchEvent(event);
    }

    if (event is LoadLocationsEvent) {
      yield* _onLoadLocationsEvent(event);
    }
  }

  Stream<HomeScreenBlocState>_onLoadLocationsEvent(HomeScreenEvent event) async* {
    yield HomeScreenLoading();
    final locations = await _locationRepository.getLocations();
    yield HomeScreenLoaded(locations);
  }

  Stream<HomeScreenBlocState>_onSearchEvent(GetSearchEvent event) async* {
    yield HomeScreenLoading();
    final locations = await _locationRepository.getLocations();
    yield HomeScreenLoaded(locations.where((element) => element.name.contains(event.searchText)).toList());
  }
}
