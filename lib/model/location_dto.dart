import 'package:equatable/equatable.dart';
import 'package:explorer_start_hack/datasource/location_entity.dart';

class LocationDto extends Equatable {
  final String name;
  final int totalFreeSpaces;

  //default until borsuk will provide data from backend
  const LocationDto(this.name, {this.totalFreeSpaces = 0});

  @override
  List<Object> get props => [name, totalFreeSpaces];
}

extension EntityMapping on LocationEntity {
  LocationDto toDto() {
    return LocationDto(this.name, totalFreeSpaces: this.totalFreeSpaces);
  }
}
