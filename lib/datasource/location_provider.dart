import 'package:explorer_start_hack/backend_config.dart';
import 'package:http/http.dart';

class LocationProvider {
  // TODO extract strings
  Future<Response> fetchLocations() => get(Uri.http(BACKEND_ADDRESS, 'home'));

  Future<Response> fetchLocationDetails(String facilityName, String date) =>
      get(Uri.http(BACKEND_ADDRESS, 'detail', {'facility': facilityName, 'date': date}));
}
