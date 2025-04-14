import 'package:courseapp/core/utils/assets_manager.dart';
import 'package:courseapp/core/utils/color_manager.dart';
import 'package:courseapp/core/utils/components/build_box_decoration.dart';
import 'package:courseapp/core/utils/styles_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomChannelsContainer extends StatelessWidget {
  const CustomChannelsContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16.0),
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: buildBoxDecoration(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Image.asset(
                    ImageAssets.perfil,
                  ),
                  SizedBox(
                    width: 10.w,
                  ),
                  Column(
                    children: [
                      Text(
                        "المستوى الأول",
                        style: getMediumStyle(
                            color: ColorManager.black500, fontSize: 18.sp),
                      ),
                    ],
                  ),
                  const Spacer(),
                  Text("11:30 PM",
                      style: getMediumStyle(
                          color: ColorManager.black500, fontSize: 14.sp))
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(right: 40),
                child: Text.rich(
                  textAlign: TextAlign.start,
                  TextSpan(children: [
                    TextSpan(
                        style: getMediumStyle(
                            color: ColorManager.black500, fontSize: 16.sp),
                        text:
                        "إزاي أقدر أخلي الكود بتاعي يرسم شكل\n معين على الشاشة؟ أنا جربت كذا حاجة\n بس ...."),
                    TextSpan(
                        style: TextStyle(
                            decoration: TextDecoration.underline,
                            fontSize: 16.sp,
                            fontFamily: "Cairo",
                            fontWeight: FontWeight.bold),
                        text: "..أنضم للمجموعة")
                  ]),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset(ImageAssets.participationImage),
                  Image.asset(ImageAssets.countImg),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}