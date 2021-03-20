part of 'home_screen_bloc.dart';

abstract class HomeScreenEvent extends Equatable {
  const HomeScreenEvent();
}

class GetSearchEvent extends HomeScreenEvent {
  final String searchText;

  GetSearchEvent(this.searchText);

  @override
  List<Object> get props => [searchText];

}

class LoadLocationsEvent extends HomeScreenEvent {

  @override
  List<Object> get props => [];
}
