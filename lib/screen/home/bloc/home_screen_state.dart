part of 'home_screen_bloc.dart';
abstract class HomeScreenState extends Equatable {
  const HomeScreenState();


  @override
  List<Object> get props => [];
}

class HomeScreenInitial extends HomeScreenState {}

class HomeScreenLoading extends HomeScreenState {}

class HomeScreenLoaded extends HomeScreenState {
  final List<LocationDto> locations;

  HomeScreenLoaded(this.locations);
}


