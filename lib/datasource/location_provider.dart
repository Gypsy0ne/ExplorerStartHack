import 'package:explorer_start_hack/datasource/home/location_entity.dart';

import 'details/location_detail_entity.dart';

class LocationProvider {
  // TODO extract strings
  Future<List<LocationEntity>> fetchLocations() =>
      Future.delayed(
          Duration(seconds: 2),
              () => [
            LocationEntity("Fribourg ancienne gare",  32, 22),
            LocationEntity("Burgdorf", 322, 122),
            LocationEntity("Uetikon", 324, 54),
            LocationEntity("Mettmenstetten", 525, 22),
            LocationEntity("St. Gallen St. Fiden", 322, 6),
          ]);

  Future<LocationDetailEntity> fetchLocationDetails() =>
      Future.delayed(
          Duration(seconds: 2),
              () =>
              LocationDetailEntity([
                12.3,
                43.2,
                33,
                66,
                44,
                33,
                23.4,
                44.3,
                32,
                77,
                66,
                57,
                86,
                45,
                34,
                34.23,
                43,
                42,
                99,
                8,
                7,
                6,
                12,
                43
              ]));
}
