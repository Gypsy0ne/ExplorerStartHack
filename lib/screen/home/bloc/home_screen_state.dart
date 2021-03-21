part of 'home_screen_bloc.dart';

abstract class HomeScreenBlocState extends Equatable {
  const HomeScreenBlocState();

  @override
  List<Object> get props => [];
}

class HomeScreenInitial extends HomeScreenBlocState {}

class HomeScreenLoading extends HomeScreenBlocState {}

class HomeScreenLoaded extends HomeScreenBlocState {
  final List<LocationDto> locations;

  HomeScreenLoaded(this.locations);
}

class HomeScreenNavigatedToDetails extends HomeScreenBlocState {
  final String facilityName;

  HomeScreenNavigatedToDetails(this.facilityName);
}
