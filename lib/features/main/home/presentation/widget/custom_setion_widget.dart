import 'package:courseapp/config/routes/routes.dart';
import 'package:courseapp/core/utils/assets_manager.dart';
import 'package:courseapp/core/utils/color_manager.dart';
import 'package:courseapp/core/utils/styles_manager.dart';
import 'package:courseapp/features/main/home/model/section_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomSectionWidget extends StatefulWidget {
  const CustomSectionWidget({super.key});

  @override
  State<CustomSectionWidget> createState() => _CustomSectionWidgetState();
}

class _CustomSectionWidgetState extends State<CustomSectionWidget> {
  final List<SectionModel> sections = [
    SectionModel(title: "الدورات التدريبية", imagePath: ImageAssets.books),
    SectionModel(title: "الالعاب", imagePath: ImageAssets.games),
    SectionModel(
        title: "التحديات والمسابقات", imagePath: ImageAssets.challenges),
  ];

  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16),
      child: Column(
        children: [
          SizedBox(
            height: 110.h,
            child: Directionality(
              textDirection: TextDirection.rtl,
              child: ListView.separated(
                separatorBuilder: (context, index) {
                  return SizedBox(
                    width: 8.w,
                  );
                },
                itemCount: sections.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  final section = sections[index];
                  final isSelected = selectedIndex == index;
                  return buildGestureDetectorItemListView(
                      index, isSelected, section);
                },
              ),
            ),
          )
        ],
      ),
    );
  }

  GestureDetector buildGestureDetectorItemListView(
      int index, bool isSelected, SectionModel section) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedIndex = index;
          if(selectedIndex==0){
            Navigator.pushNamed(context, Routes.programmingView);
          }else if(selectedIndex==1){
            Navigator.pushNamed(context, Routes.gamesView);
          }else if(selectedIndex==2){
            Navigator.pushNamed(context, Routes.challengesView);
          }
        });
      },
      child: Container(
        width: 170.w,
        height: 100.h,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.r),
            border: Border.all(color: ColorManager.primary700, width: 2),
            color: isSelected ? ColorManager.primary700 : ColorManager.white),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(section.imagePath, height: 35),
            const SizedBox(height: 6),
            Text(
              textAlign: TextAlign.center,
              maxLines: 2,
              section.title,
              style: getMediumStyle(
                fontSize: 20.sp,
                color:
                isSelected ? ColorManager.white : ColorManager.primary700,
              ),
            ),
          ],
        ),
      ),
    );
  }
}