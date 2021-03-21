import 'package:explorer_start_hack/datasource/location_datasource.dart';
import 'package:explorer_start_hack/datasource/sbb_location_datasource.dart';
import 'package:explorer_start_hack/model/location_detail_dto.dart';
import 'package:explorer_start_hack/model/location_dto.dart';

class LocationRepository {
  // TODO inject it
  final LocationDataSource _dataSource = SbbLocationDataSource();

  Future<List<LocationDto>> getLocations() async {
    var locations = await _dataSource.getLocations();
    return locations.map((entity) => entity.toDto()).toList();


  }

  Future<LocationDetailDto> getLocationDetails(String facilityName, String date) async {
    var details = await _dataSource.getLocationDetails(facilityName, date);
    return details.toDto();
  }
}
