import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'location_detail_entity.g.dart';

@JsonSerializable()
class LocationDetailEntity extends Equatable{

  final List<double> preds;

  LocationDetailEntity(this.preds);

  factory LocationDetailEntity.fromJson(Map<String, dynamic> json) => _$LocationDetailEntityFromJson(json);

  Map<String, dynamic> toJson() => _$LocationDetailEntityToJson(this);

  @override
  List<Object> get props => [preds];
}