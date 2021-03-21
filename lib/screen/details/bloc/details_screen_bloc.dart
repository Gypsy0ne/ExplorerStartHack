import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:explorer_start_hack/model/location_detail_dto.dart';
import 'package:explorer_start_hack/repository/location_repository.dart';

part 'details_screen_event.dart';

part 'details_screen_state.dart';

class DetailsScreenBloc extends Bloc<DetailsScreenEvent, DetailsScreenState> {
  DetailsScreenBloc() : super(DetailsScreenInitial());
  final LocationRepository _locationRepository = LocationRepository();
  @override
  Stream<DetailsScreenState> mapEventToState(
    DetailsScreenEvent event,
  ) async* {
    // Geting Event
    if (event is LoadChartEvent || event is CalendarChangeEvent) {
      _loadChartEvent(event);
    }
  }

Future<List>  _getpreds() async {
    final fetchedLocations = await _locationRepository.getPreds();
     
    return fetchedLocations;

}

Stream<DetailsScreenState> _loadChartEvent(LoadChartEvent event) async* {
  yield DetailsScreenLoading();
  final preds= _getpreds;
  List<LocationDetailDto> fetchedPreds;


  
    
  // get data from database final prop = await _getProps
  yield DetailsScreenLoaded(_cachedPreds);
}}
