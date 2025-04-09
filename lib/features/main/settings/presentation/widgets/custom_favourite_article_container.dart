import 'package:courseapp/config/routes/routes.dart';
import 'package:courseapp/core/utils/color_manager.dart';
import 'package:courseapp/core/utils/components/build_box_decoration.dart';
import 'package:courseapp/core/utils/styles_manager.dart';
import 'package:courseapp/core/utils/values_manager.dart';
import 'package:courseapp/features/main/fathers/model/model.dart';
import 'package:courseapp/features/main/settings/presentation/widgets/custom_favourite_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomFavouriteArticleContainer extends StatefulWidget {
  const CustomFavouriteArticleContainer({super.key, required this.image});

  final String image;

  @override
  State<CustomFavouriteArticleContainer> createState() =>
      _CustomFavouriteArticleContainerState();
}

class _CustomFavouriteArticleContainerState
    extends State<CustomFavouriteArticleContainer> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
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
              widget.image,
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
              child: GestureDetector(
                onTap: (){
                  Navigator.pushNamed(context, Routes.articlesView,arguments: Model);
                },
                child: Text.rich(
                    textDirection: TextDirection.rtl,
                    TextSpan(
                        text:
                            "في العصر الرقمي الذي نعيشه الآن،فإن في العصر الرقمي، لم تعد البرمجة مجرد مهارة تقنية، بل أصبحت لغة العصر الحديث، تمامًا مثلما .....\n ",
                        style: getMediumStyle(
                          color: ColorManager.black500,
                        ),
                        children: const [
                          TextSpan(
                              style:
                                  TextStyle(decoration: TextDecoration.underline),
                              text: "أقرأ المزيد")
                        ])),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
