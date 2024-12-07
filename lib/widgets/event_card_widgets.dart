import 'package:flutter/material.dart';
import 'package:gdg_app/screens/event_screen.dart';
import 'package:gdg_app/utils/event_provider.dart';

class EventCardWidgets extends StatelessWidget {
  const EventCardWidgets({
    super.key,
    required this.events,
    required this.index,
    required this.eventName,
  });
  final List<EventDetails> events;
  final int index;
  final Event eventName;

  @override
  Widget build(BuildContext context) {
    String buttonName;
    if (eventName == Event.upcomingEvents) {
      buttonName = "Register";
    } else if (eventName == Event.ongoingEvents) {
      buttonName = "Join Us";
    } else {
      buttonName = "Get info";
    }
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 2, horizontal: 10),
      height: 100,
      width: 100,
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Stack(
        fit: StackFit.loose,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Image.asset(
              fit: BoxFit.cover,
              events[index].eventImagePath,
              height: double.infinity,
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: OutlinedButton(
              onPressed: () {},
              style: OutlinedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(80)),
                  backgroundColor: Colors.white,
                  fixedSize: Size(double.infinity, 2),
                  foregroundColor: Colors.black,
                  textStyle: const TextStyle(fontSize: 12),
                  side: BorderSide(color: Colors.white)),
              child: Text(buttonName),
            ),
          )
        ],
      ),
    );
  }
}
