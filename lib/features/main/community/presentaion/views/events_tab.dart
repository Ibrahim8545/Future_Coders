import 'package:courseapp/features/main/community/presentaion/widgets/custom_future_event_container.dart';
import 'package:flutter/material.dart';

class EventsTab extends StatelessWidget {
  const EventsTab({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 8.0),
        child: Column(
          children: [
            CustomFutureEventContainer(),
          ],
        ),
      ),
    );
  }
}
