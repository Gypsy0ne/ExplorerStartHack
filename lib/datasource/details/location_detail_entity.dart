import 'package:equatable/equatable.dart';

class LocationDetailEntity extends Equatable{

  final List<double> preds;

  LocationDetailEntity(this.preds);

  @override
  List<Object> get props => [preds];
}