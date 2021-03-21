import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:explorer_start_hack/model/location_detail_dto.dart';
import 'package:explorer_start_hack/repository/location_repository.dart';

part 'details_screen_event.dart';

part 'details_screen_state.dart';

class DetailsScreenBloc extends Bloc<DetailsScreenEvent, DetailsScreenState> {
  DetailsScreenBloc() : super(DetailsScreenInitial());
  // TODO inject it
  final LocationRepository _locationRepository = LocationRepository();

  @override
  Stream<DetailsScreenState> mapEventToState(
    DetailsScreenEvent event,
  ) async* {
    // Geting Event
    if (event is LoadChartEvent) {
      yield* _loadChartEvent(event.facilityName, event.date);
    }
    if (event is CalendarChangeEvent) {
      yield* _loadChartEvent(event.facilityName, event.date);
    }
  }

  Stream<DetailsScreenState> _loadChartEvent(String facilityName, String date) async* {
    yield DetailsScreenLoading();
    final details = await _locationRepository.getLocationDetails(facilityName, date);
    yield DetailsScreenLoaded(details);
  }
}


