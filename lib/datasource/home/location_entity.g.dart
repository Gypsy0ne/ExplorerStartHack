// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'location_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LocationEntity _$LocationEntityFromJson(Map<String, dynamic> json) {
  return LocationEntity(
    json['facility'] as String,
    json['max_spots'] as int,
    json['taken_all'] as int,
  );
}

Map<String, dynamic> _$LocationEntityToJson(LocationEntity instance) =>
    <String, dynamic>{
      'facility': instance.facility,
      'max_spots': instance.maxSpots,
      'taken_all': instance.takenAll,
    };
