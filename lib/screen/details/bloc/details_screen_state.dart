part of 'details_screen_bloc.dart';

abstract class DetailsScreenState extends Equatable {
  const DetailsScreenState();
  
  @override
  List<Object> get props => [];
}

class DetailsScreenInitial extends DetailsScreenState {}
class DetailsScreenLoading extends DetailsScreenState {}

class DetailsScreenLoaded extends DetailsScreenState { 
  final LocationDetailDto details;

  DetailsScreenLoaded(this.details);

}