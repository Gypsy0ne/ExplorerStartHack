import 'package:equatable/equatable.dart';

class LocationEntity extends Equatable {
  final String name;
  final int totalFreeSpaces;

  const LocationEntity(this.name, this.totalFreeSpaces);

  @override
  List<Object> get props => [name, totalFreeSpaces];
}