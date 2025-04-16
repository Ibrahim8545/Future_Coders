import 'package:courseapp/core/utils/assets_manager.dart';
import 'package:courseapp/features/main/home/model/challenge_model.dart';
import 'package:courseapp/features/main/home/presentation/widget/custom_challenge_card.dart';
import 'package:courseapp/features/main/settings/presentation/widgets/custom_app_bar.dart';
import 'package:courseapp/features/main/settings/presentation/widgets/custom_app_bar_title.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChallengesViewBody extends StatefulWidget {
   const ChallengesViewBody({super.key});

  @override
  State<ChallengesViewBody> createState() => _ChallengesViewBodyState();
}

class _ChallengesViewBodyState extends State<ChallengesViewBody> {
   int selectedIndex = 0;

  final List<ChallengeModel> challenges = [
    ChallengeModel(
      level: "المستوى الأول",
      title: "لعبة التخمين",
      description: "البرنامج يختار رقمًا عشوائيًا\n وعلى المستخدم تخمينه.",
      skills: "random، while، if-else",
      imagePath: ImageAssets.challengeOne,
    ),
    ChallengeModel(
      level: "المستوى الثاني",
      title: "حركة السلحفاة",
      description: "البرنامج يرسم السلحفاة\nالمسار عند تحريكها.",
      skills: " استخدام مكتبة turtle",
      imagePath: ImageAssets.challengeTwo,
    ),
    ChallengeModel(
      level: "المستوى الثالث",
      title: "اختبار المغامرة",
      description:
      "إنشاء قصة تفاعلية حيث\nيختار اللاعب بين خيارات مختلفة\nتؤدي إلى نتائج متنوعة.",
      skills: "استخدام if-else لصنع  \nقصة تفاعلية.",
      imagePath: ImageAssets.challengeThree,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const CustomRowAppBarTitle(title: "التحديات "),
        Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(
              height: 150.h,
            ),
            Expanded(
              child: ListView.builder(
                padding: EdgeInsets.all(16.w),
                itemCount: challenges.length,
                itemBuilder: (context, index) {
                  return CustomChallengeCard(challenge: challenges[index],onTap: (){
                    setState(() {
                      selectedIndex=index;
                    });
                  },isSelected: selectedIndex==index,);
                },
              ),
            ),
          ],
        ),
        const CustomAppBar(),
      ],
    );
  }
}



