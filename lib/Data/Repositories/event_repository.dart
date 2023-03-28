// import 'dart:developer';

import 'package:eventapp/Data/Repositories/api/api.dart';
import 'package:flutter/material.dart';
import '../Models/event_model.dart';

class EventRepository {
  final API api = API();

  Future<List<dynamic>> getEvents() async {
    try {
      final response = await api.get('/v1/event');

      var data = response.data['content']['data'];

      return data.map((eventMap) => Datum.fromJson(eventMap)).toList();

      // EventModel eventModel = EventModel.fromJson(data);
      // List<Datum> events = eventModel.content.data;

      // return events;

      // inspect(response.data);
      // return response.data;
    } catch (e) {
      debugPrint(e.toString());
      rethrow;
    }
  }
}
