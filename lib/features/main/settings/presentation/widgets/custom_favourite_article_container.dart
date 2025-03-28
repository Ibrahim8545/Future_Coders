import 'package:courseapp/core/utils/assets_manager.dart';
import 'package:courseapp/core/utils/color_manager.dart';
import 'package:courseapp/core/utils/components/build_box_decoration.dart';
import 'package:courseapp/core/utils/styles_manager.dart';
import 'package:courseapp/core/utils/values_manager.dart';
import 'package:courseapp/features/main/settings/presentation/widgets/custom_favourite_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomFavouriteArticleContainer extends StatelessWidget {
  const CustomFavouriteArticleContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  const EdgeInsets.symmetric(
          horizontal: AppPadding.p20, vertical: AppPadding.p20),
      child: Container(
        decoration: buildBoxDecoration(),
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.all(AppPadding.p16),
              child: CustomFavouriteIcon(),
            ),
            Image.asset(
              ImageAssets.articleImage,
              fit: BoxFit.fitWidth,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: AppPadding.p28),
              child: Text(
                textDirection: TextDirection.rtl,
                "البرمجة: لغة المستقبل في عصر الذكاء الاصطناعي",
                style: getMediumStyle(
                  color: ColorManager.black500,
                ),
              ),
            ),
            SizedBox(
              height: AppSize.s14.h,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: AppPadding.p28),
              child: Text.rich(
                  textDirection: TextDirection.rtl,
                  TextSpan(
                      text:
                      "في العصر الرقمي الذي نعيشه الآن،فإن في العصر الرقمي، لم تعد البرمجة مجرد مهارة تقنية، بل أصبحت لغة العصر الحديث، تمامًا مثلما .....\n ",
                      style: getMediumStyle(
                        color: ColorManager.black500,
                      ),
                      children: const [TextSpan(
                          style: TextStyle(
                              decoration: TextDecoration.underline
                          ),
                          text: "أقرأ المزيد")])),
            ),
          ],
        ),
      ),
    );
  }
}