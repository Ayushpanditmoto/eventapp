import 'package:eventapp/Data/Repositories/event_repository.dart';
import 'package:eventapp/Logic/cubits/event.state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EventCubit extends Cubit<EventState> {
  EventCubit() : super(EventStateLoading()) {
    getEvents();
  }

  EventRepository eventRepository = EventRepository();

  Future<void> getEvents() async {
    emit(EventStateLoading());
    try {
      final events = await eventRepository.getEvents();
      emit(EventStateSuccess(events));
    } catch (e) {
      emit(EventStateError(e.toString()));
    }
  }
}
