import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'location_entity.g.dart';

@JsonSerializable()
class LocationEntity extends Equatable {
  final String facility;
  @JsonKey(name: 'max_spots')
  final int maxSpots;
  @JsonKey(name: 'taken_all')
  final int takenAll;

  const LocationEntity(this.facility, this.maxSpots, this.takenAll);

  factory LocationEntity.fromJson(Map<String, dynamic> json) => _$LocationEntityFromJson(json);

  Map<String, dynamic> toJson() => _$LocationEntityToJson(this);

  @override
  List<Object> get props => [facility, maxSpots, takenAll];
}