import 'package:equatable/equatable.dart';

class LocationEntity extends Equatable {
  final String facility;
  final int maxSpots;
  final int takenAll;

  const LocationEntity(this.facility, this.maxSpots, this.takenAll);

  @override
  List<Object> get props => [facility, maxSpots, takenAll];
}