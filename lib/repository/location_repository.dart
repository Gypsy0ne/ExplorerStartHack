import 'package:explorer_start_hack/datasource/location_datasource.dart';
import 'package:explorer_start_hack/datasource/sbb_location_datasource.dart';
import 'package:explorer_start_hack/model/location_dto.dart';

abstract class LocationRepository {
  // TODO inject it
  final LocationDataSource _dataSource = SbbLocationDataSource();

  List<LocationDto> getLocations() =>
      _dataSource.getLocations().map((entity) => entity.toDto());
}
