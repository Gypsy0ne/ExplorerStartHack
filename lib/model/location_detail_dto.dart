import 'package:equatable/equatable.dart';

class LocationDetailDto extends Equatable {
  final List<double> predictions;

  LocationDetailDto(this.predictions);

  @override
  List<Object> get props => [predictions];
}
