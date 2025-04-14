import 'package:courseapp/features/main/community/presentaion/widgets/custom_channels_container.dart';
import 'package:flutter/material.dart';

class ChannelsTab extends StatelessWidget {
  const ChannelsTab({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          children: [
            CustomChannelsContainer(),
          ],
        ),
      ),
    );
  }
}
