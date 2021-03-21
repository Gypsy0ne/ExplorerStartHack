import 'details/location_detail_entity.dart';
import 'home/location_entity.dart';

abstract class LocationDataSource {
  Future<List<LocationEntity>> getLocations();
  Future<LocationDetailEntity> getLocationDetails(String facilityName, String date);
}