import 'package:explorer_start_hack/datasource/location_datasource.dart';
import 'package:explorer_start_hack/datasource/home/location_entity.dart';
import 'package:explorer_start_hack/datasource/location_provider.dart';

import 'details/location_detail_entity.dart';

class SbbLocationDataSource implements LocationDataSource {

  final LocationProvider _locationProvider = LocationProvider();

  @override
  Future<List<LocationEntity>> getLocations() => _locationProvider.fetchLocations();

  @override
  Future<LocationDetailEntity> getLocationDetails() => _locationProvider.fetchLocationDetails();

}