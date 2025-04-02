import 'package:courseapp/core/utils/color_manager.dart';
import 'package:courseapp/core/utils/styles_manager.dart';
import 'package:courseapp/features/auth/prestation/widget/custom_buttom.dart';
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
            style: getLightStyle(color: Color(0xffC3B109)),
          ),
          SizedBox(
            height: 12.h,
          ),
          Container(
            width: 200, // عرض محدد بدلًا من اللانهائي
            height: 50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: const Color(0xff0A638F),
            ),
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset('assets/images/BULB2C 2.png'),
                  Text('ابدا الان',
                      style: getMediumStyle(color: ColorManager.white))
                ],
              ),
            ),
          )
        ],
      ),
    ]);
  }
}
