part of 'details_screen_bloc.dart';

abstract class DetailsScreenEvent extends Equatable {
  const DetailsScreenEvent();

  @override
  List<Object> get props => [];
}

class CalendarChangeEvent extends DetailsScreenEvent {
  final String facilityName;
  final String date;

  CalendarChangeEvent(this.facilityName, this.date);
}

class LoadChartEvent extends DetailsScreenEvent {
  final String facilityName;
  final String date;

  LoadChartEvent(this.facilityName, this.date);
}