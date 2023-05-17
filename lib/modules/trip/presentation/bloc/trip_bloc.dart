import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'trip_event.dart';
part 'trip_state.dart';
part 'trip_bloc.freezed.dart';

class TripBloc extends Bloc<TripEvent, TripState> {
  TripBloc() : super(const _Initial()) {
    on<TripEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
