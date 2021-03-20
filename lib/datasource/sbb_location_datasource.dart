import 'package:explorer_start_hack/datasource/location_datasource.dart';
import 'package:explorer_start_hack/datasource/location_entity.dart';
import 'package:explorer_start_hack/datasource/location_provider.dart';

class SbbLocationDataSource implements LocationDataSource {

  final LocationProvider _locationProvider = LocationProvider();
  @override
  Future<List<LocationEntity>> getLocations() => _locationProvider.fetchLocations();

}