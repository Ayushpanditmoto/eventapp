abstract class EventState {}

class EventStateLoading extends EventState {}

class EventStateSuccess extends EventState {
  final List<dynamic> events;

  EventStateSuccess(this.events);
}

class EventStateError extends EventState {
  final String message;

  EventStateError(this.message);
}
