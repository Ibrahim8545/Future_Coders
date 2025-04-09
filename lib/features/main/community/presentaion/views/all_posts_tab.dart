import 'package:flutter/material.dart';

class AllPostsTab extends StatelessWidget {
  const AllPostsTab({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child:  Center(
        child: Text("posts "),
      ),
    );
  }
}
