import 'package:courseapp/core/utils/values_manager.dart';
import 'package:courseapp/features/main/settings/presentation/widgets/custom_app_bar.dart';
import 'package:courseapp/features/main/settings/presentation/widgets/custom_app_bar_title.dart';
import 'package:courseapp/features/main/settings/presentation/widgets/custom_container_help_and_communication.dart';
import 'package:flutter/material.dart';

class HelpViewBody extends StatelessWidget {
  const HelpViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Stack(
      children: [
        Column(
          children: [
            CustomRowAppBarTitle(
              title: "المساعده و التواصل",
            ),
            SizedBox(height: AppSize.s50),
            CustomContainerHelpAndCommunication(title: 'الاسئله الشائعه '),
            CustomContainerHelpAndCommunication(title: 'التواصل مع الدعم الفني '),
            CustomContainerHelpAndCommunication(title: 'روابط المواد التعليمية '),
            CustomContainerHelpAndCommunication(title: 'السياسات و الشروط '),
          ],
        ),
        CustomAppBar(),
      ],
    );
  }
}

