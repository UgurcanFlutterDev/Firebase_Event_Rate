import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eventrate/features/app-features/events/models/events/event-list/event_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class EventDetailsScreen extends StatelessWidget {
  const EventDetailsScreen({super.key, required this.event});
  final EventModel event;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          event.title ?? "",
        ),
      ),
      body: Column(
        children: [
          Text(event.description ?? "Bu organizasyon için açıklama bulunmuyor."),
        ],
      ),
    );
  }
}
