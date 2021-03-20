import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:explorer_start_hack/model/location_dto.dart';
import 'package:explorer_start_hack/repository/location_repository.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

part 'home_screen_event.dart';

part 'home_screen_state.dart';

class HomeScreenBloc extends Bloc<HomeScreenEvent, HomeScreenBlocState> {
  HomeScreenBloc() : super(HomeScreenInitial());

  // TODO inject it
  final LocationRepository _locationRepository = LocationRepository();
  List<LocationDto> _cachedLocations = List.empty();

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

  Future<List<LocationDto>>_getLocationsAndCache() async {
    final fetchedLocations = await _locationRepository.getLocations();
    _cachedLocations = fetchedLocations;
    return fetchedLocations;
  }

  Stream<HomeScreenBlocState> _onLoadLocationsEvent(
      HomeScreenEvent event) async* {
    yield HomeScreenLoading();
    final locations = await _getLocationsAndCache();
    yield HomeScreenLoaded(locations);
  }


  Stream<HomeScreenBlocState> _onSearchEvent(GetSearchEvent event) async* {
    yield HomeScreenLoading();
    List<LocationDto> fetchedLocations;

    if(_cachedLocations.isNotEmpty) {
      fetchedLocations = _cachedLocations;
    } else {
      fetchedLocations = await _getLocationsAndCache();
    }

    final locations = fetchedLocations.where((element) => element.facility.toLowerCase().contains(event.searchText.toLowerCase())).toList();
    yield HomeScreenLoaded(locations);

  }
}
