import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'details_screen_event.dart';

part 'details_screen_state.dart';

class DetailsScreenBloc extends Bloc<DetailsScreenEvent, DetailsScreenState> {
  DetailsScreenBloc() : super(DetailsScreenInitial());

  @override
  Stream<DetailsScreenState> mapEventToState(
    DetailsScreenEvent event,
  ) async* {
    // Geting Event
    if (event is LoadChartEvent || event is CalendarChangeEvent) {
      _loadChartEvent(event);
    }
  }
}

Stream<DetailsScreenState> _loadChartEvent(LoadChartEvent event) async* {
  yield DetailsScreenLoading();


  // get data from database final prop = await _getProps
  yield DetailsScreenLoaded();
}
