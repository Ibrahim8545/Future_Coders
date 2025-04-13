import 'package:courseapp/core/utils/assets_manager.dart';
import 'package:courseapp/core/utils/color_manager.dart';
import 'package:courseapp/core/utils/components/build_box_decoration.dart';
import 'package:courseapp/core/utils/styles_manager.dart';
import 'package:courseapp/features/main/community/presentaion/widgets/custom_details_events.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomFutureEventContainer extends StatelessWidget {
  const CustomFutureEventContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8),
        child: Container(
          decoration: buildBoxDecoration(),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16),
            child: Column(
              children: [
                Image.asset(ImageAssets.eventsImg),
                Text(
                  "ملتقى المبرمجين الصغار: رحلة ممتعة لاستكشاف عالم البرمجة والإبداع الرقمي!",
                  style: getMediumStyle(color: ColorManager.black500),
                ),
                Column(
                  children: [
                    Row(
                      children: [
                        const CustomDetailsEvents(icon: FontAwesomeIcons.locationDot, title: "القاهرة "),
                        SizedBox(width: 64.w,),
                        const CustomDetailsEvents(icon: FontAwesomeIcons.calendarDays, title: " مارس ,20-9 مساء "),

                      ],
                    ),
                    const CustomDetailsEvents(icon: FontAwesomeIcons.ccMastercard, title: "  السعر=100ج"),

                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
