import 'package:explorer_start_hack/datasource/location_entity.dart';

class LocationProvider {
  // TODO extract strings
  Future<List<LocationEntity>> fetchLocations() => Future.delayed(
      Duration(seconds: 2),
      () => [
            LocationEntity("Fribourg ancienne gare", totalFreeSpaces: 32),
            LocationEntity("Burgdorf", totalFreeSpaces: 322),
            LocationEntity("Uetikon", totalFreeSpaces: 324),
            LocationEntity("Mettmenstetten", totalFreeSpaces: 525),
            LocationEntity("St. Gallen St. Fiden", totalFreeSpaces: 322),
          ]);
}
