part of 'home_screen_bloc.dart';

abstract class HomeScreenEvent extends Equatable {
  const HomeScreenEvent();
}
class GetSearchEvent extends Equatable {
  final String searchText;
  GetSearchEvent(this.searchText)

  @override
  List<Object> get props => [searchText];
}

