import 'location_entity.dart';

abstract class LocationDataSource {
  Future<List<LocationEntity>> getLocations();
}