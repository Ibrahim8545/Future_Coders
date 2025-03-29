import 'package:courseapp/core/utils/assets_manager.dart';
import 'package:courseapp/core/utils/values_manager.dart';
import 'package:courseapp/features/main/cources/presentation/widgets/custom_task_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TasksTab extends StatelessWidget {
  const TasksTab({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: AppPadding.p16,
          ),
          child: Column(
            children: [
              CustomTaskContainer(
                image: ImageAssets.tasks,
                code:
                    "Jump = False\nif Jump:\nprint (“The cat jumps!”) \nelse:\nprint (“The cat stays on the ground.”)",
                subTitle:
                    "هناك قطة تريد القفز فوق الحاجز لكن الكود به خطا يجعلها لا تتحرك! هل يمكنك اصلاحة ؟",
              ),
              SizedBox(
                height: AppSize.s16.h,
              ),
              CustomTaskContainer(
                image: ImageAssets.taskImg,
                subTitle:
                    'ساعد الروبوت ف الوصول الي الكنز بكتابة كود التحرك للامام والانعطاف يمينا ويسارا',
              ),
            ],
          ),
        )
      ],
    );
  }
}


