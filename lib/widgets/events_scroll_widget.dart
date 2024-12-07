import 'package:flutter/material.dart';
import 'package:gdg_app/screens/event_screen.dart';
import 'package:gdg_app/utils/event_provider.dart';
import 'package:gdg_app/widgets/event_card_widgets.dart';

class EventsScrollWidget extends StatelessWidget {
  const EventsScrollWidget(
      {super.key, required this.events, required this.eventName});
  final List<EventDetails> events;
  final Event eventName;

  @override
  Widget build(BuildContext context) {
    String event;
    if (eventName == Event.upcomingEvents) {
      event = "UPCOMING EVENTS";
    } else if (eventName == Event.ongoingEvents) {
      event = "ONGOING EVENTS";
    } else {
      event = "PAST EVENTS";
    }

    Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(event),
              TextButton(
                onPressed: () {},
                child: const Text(
                  'See All >',
                  // style: TextStyle(fontSize: 18),
                ),
              )
            ],
          ),
        ),
        SizedBox(
          height: size.height / 5,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: events.length,
            itemBuilder: (context, index) => EventCardWidgets(
              events: events,
              index: index,
              eventName: eventName,
            ),
          ),
        ),
      ],
    );
  }
}
