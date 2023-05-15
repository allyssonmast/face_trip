import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'contact_details_event.dart';
part 'contact_details_state.dart';
part 'contact_details_bloc.freezed.dart';

@injectable
class ContactDetailsBloc
    extends Bloc<ContactDetailsEvent, ContactDetailsState> {
  ContactDetailsBloc() : super(_Initial()) {
    on<ContactDetailsEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}