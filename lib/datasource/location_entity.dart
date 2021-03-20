import 'package:equatable/equatable.dart';

class LocationEntity extends Equatable {
  final String name;
  final int totalFreeSpaces;

  //default until borsuk will provide data from backend
  const LocationEntity(this.name, {this.totalFreeSpaces = 0});

  @override
  List<Object> get props => [name, totalFreeSpaces];
}