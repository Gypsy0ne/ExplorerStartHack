import 'package:equatable/equatable.dart';
import 'package:explorer_start_hack/datasource/details/location_detail_entity.dart';

class LocationDetailDto extends Equatable {
  final List<double> predictions;

  LocationDetailDto(this.predictions);

  @override
  List<Object> get props => [predictions];
}
extension LocationDetailsEntityMapping on LocationDetailEntity {
  LocationDetailDto toDto() {
    return LocationDetailDto(this.preds);
  }
}