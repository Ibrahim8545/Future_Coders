import 'package:courseapp/config/routes/routes.dart';
import 'package:courseapp/core/utils/color_manager.dart';
import 'package:courseapp/core/utils/components/build_box_decoration.dart';
import 'package:courseapp/core/utils/styles_manager.dart';
import 'package:courseapp/core/utils/values_manager.dart';
import 'package:courseapp/features/main/settings/presentation/widgets/custom_favourite_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'custom_elevated_button.dart';
class CustomFavouriteBooksContainer extends StatelessWidget {
  const CustomFavouriteBooksContainer({super.key, required this.image});
final String image;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppPadding.p20,vertical: AppPadding.p20),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 20),
        decoration: buildBoxDecoration(),
        child: Column(
          children: [
            const CustomFavouriteIcon(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  children: [
                    Text.rich(
                        textAlign:TextAlign.center,
                        TextSpan(
                          children: [
                            TextSpan(
                                text: "اجعل طفلك مبرمجا\nً",
                                style: getMediumStyle(
                                  color: ColorManager.black500,
                                )),
                            TextSpan(
                                text: "لبنى حسانً",
                                style: getMediumStyle(
                                  color: ColorManager.primary700,
                                )),
                          ],
                        )),
                    SizedBox(height: AppSize.s16.h,),
                    Row(
                      children: [
                        Icon(Icons.star,color: ColorManager.yellow),
                        SizedBox(width: 10.w),
                        Icon(Icons.star,color: ColorManager.yellow),
                        SizedBox(width: 10.w),
                        Icon(Icons.star,color: ColorManager.yellow),
                        SizedBox(width: 10.w),
                        Icon(Icons.star,color: ColorManager.yellow),
                      ],
                    ),
                     Padding(
                      padding: const EdgeInsets.only(top: AppPadding.p20),
                      child: CustomElevatedButton(
                        textColor: ColorManager.white,
                        color: ColorManager.primary700,
                        title: "أقرأ الان",onPressed: (){
                        Navigator.pushNamed(context, Routes.booksView);
                      },),
                    )
                  ],
                ),
                Image.asset(image),
              ],
            )
          ],
        ),
      ),
    );
  }
}
