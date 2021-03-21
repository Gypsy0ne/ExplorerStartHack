// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'location_detail_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LocationDetailEntity _$LocationDetailEntityFromJson(Map<String, dynamic> json) {
  return LocationDetailEntity(
    (json['preds'] as List<dynamic>).map((e) => (e as num).toDouble()).toList(),
  );
}

Map<String, dynamic> _$LocationDetailEntityToJson(
        LocationDetailEntity instance) =>
    <String, dynamic>{
      'preds': instance.preds,
    };
