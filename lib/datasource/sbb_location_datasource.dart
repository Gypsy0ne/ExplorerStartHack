import 'dart:async';
import 'dart:convert';

import 'package:explorer_start_hack/datasource/location_datasource.dart';
import 'package:explorer_start_hack/datasource/home/location_entity.dart';
import 'package:explorer_start_hack/datasource/location_provider.dart';

import 'details/location_detail_entity.dart';

class SbbLocationDataSource implements LocationDataSource {

  final LocationProvider _locationProvider = LocationProvider();

  @override
  Future<List<LocationEntity>> getLocations() async {
    final response = await _locationProvider.fetchLocations();

    if (response.statusCode == 200) {
      Iterable entities = json.decode(response.body);
      return Future.value(List<LocationEntity>.from(
          entities.map((entity) => LocationEntity.fromJson(entity))).toList()
      );
    } else {
      throw Exception('Failed to load locations');
    }
  }

  @override
  Future<LocationDetailEntity> getLocationDetails() =>
      _locationProvider.fetchLocationDetails();

}