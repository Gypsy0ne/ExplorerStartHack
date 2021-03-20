part of 'details_screen_bloc.dart';

abstract class DetailsScreenEvent extends Equatable {
  const DetailsScreenEvent();

  @override
  List<Object> get props => [];
}

class CalendarChangeEvent extends DetailsScreenEvent
{

}
class LoadChartEvent extends DetailsScreenEvent
{

}