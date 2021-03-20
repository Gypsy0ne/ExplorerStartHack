import 'location_entity.dart';

abstract class LocationDataSource {
  List<LocationEntity> getLocations();
}