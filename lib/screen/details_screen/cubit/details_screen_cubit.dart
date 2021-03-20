import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'details_screen_state.dart';

class DetailsScreenCubit extends Cubit<DetailsScreenState> {
  DetailsScreenCubit() : super(DetailsScreenInitial());
}
