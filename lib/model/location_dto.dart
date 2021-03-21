import 'package:equatable/equatable.dart';
import 'package:explorer_start_hack/datasource/home/location_entity.dart';

class LocationDto extends Equatable {
  final String facility;
  final int maxSpots;
  final int takenAll;

  const LocationDto(this.facility, this.maxSpots, this.takenAll);

  @override
  List<Object> get props => [facility, maxSpots, takenAll];
}

extension EntityMapping on LocationEntity {
  LocationDto toDto() {
    return LocationDto(this.facility, this.maxSpots, this.takenAll);
  }
}
