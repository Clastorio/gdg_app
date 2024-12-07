import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gdg_app/utils/event_provider.dart';
import 'package:gdg_app/widgets/events_scroll_widget.dart';

enum Event {
  upcomingEvents,
  ongoingEvents,
  pastEvents,
}

class EventScreen extends ConsumerStatefulWidget {
  const EventScreen({super.key});

  @override
  ConsumerState<EventScreen> createState() => _EventScreenState();
}

class _EventScreenState extends ConsumerState<EventScreen> {
  @override
  Widget build(BuildContext context) {
    List<EventDetails> upcomingEvents =
        ref.watch(eventProvider.notifier).upcomingEvents();
    List<EventDetails> ongoingEvents =
        ref.watch(eventProvider.notifier).ongoingEvents();
    List<EventDetails> pastEvents =
        ref.watch(eventProvider.notifier).pastEvents();

    return Scaffold(
      body: ListView(
        children: [
          EventsScrollWidget(
            events: upcomingEvents,
            eventName: Event.upcomingEvents,
          ),
          EventsScrollWidget(
            events: ongoingEvents,
            eventName: Event.ongoingEvents,
          ),
          EventsScrollWidget(
            events: pastEvents,
            eventName: Event.pastEvents,
          ),
        ],
      ),
    );
  }
}
