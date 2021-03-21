import 'package:explorer_start_hack/datasource/location_datasource.dart';
import 'package:explorer_start_hack/datasource/sbb_location_datasource.dart';
import 'package:explorer_start_hack/model/location_dto.dart';

class LocationRepository {
  // TODO inject it
  final LocationDataSource _dataSource = SbbLocationDataSource();

  Future<List<LocationDto>> getLocations() async {
    var locations = await _dataSource.getLocations();
    return locations.map((entity) => entity.toDto()).toList();
  }
}
