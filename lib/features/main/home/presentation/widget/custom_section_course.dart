import 'package:courseapp/config/routes/routes.dart';
import 'package:courseapp/core/utils/assets_manager.dart';
import 'package:courseapp/core/utils/color_manager.dart';
import 'package:courseapp/core/utils/styles_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomSectionCourse extends StatelessWidget {
  const CustomSectionCourse({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Image.asset('assets/images/setionImage.png'),
      Spacer(),
      Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            textAlign: TextAlign.end,
            'ابحث عن الدورة التدريبية \nالتي تريد تعلمها',
            style: getRegularStyle(color: Colors.black)
                .copyWith(fontWeight: FontWeight.w500, fontSize: 20.sp),
          ),
          SizedBox(
            height: 4.h,
          ),
          Text(
            '!ابدأ تجربتك المجانية لمدة ١٤ يوم',
            style: getLightStyle(color: const Color(0xffC3B109)),
          ),
          SizedBox(
            height: 12.h,
          ),
          GestureDetector(
            onTap: (){
              Navigator.pushNamed(context, Routes.payment);
            },
            child: Container(
              width: 200,
              height: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color:  ColorManager.primary700,
              ),
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(IconsAssets.BULBCIcon),
                    Text('ابدا الان',
                        style: getMediumStyle(color: ColorManager.white))
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    ]);
  }
}
