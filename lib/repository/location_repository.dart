import 'package:explorer_poc/model/location_entity.dart';

abstract class LocationRepository {
  List<LocationEntity> getLocations();
}