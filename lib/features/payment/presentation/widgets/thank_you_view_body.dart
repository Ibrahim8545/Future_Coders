import 'package:courseapp/config/routes/routes.dart';
import 'package:courseapp/core/utils/assets_manager.dart';
import 'package:courseapp/core/utils/color_manager.dart';
import 'package:courseapp/core/utils/styles_manager.dart';
import 'package:courseapp/features/main/settings/presentation/widgets/custom_elevated_button.dart';
import 'package:courseapp/features/payment/presentation/widgets/custom_payment_details_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ThankYouViewBody extends StatelessWidget {
  const ThankYouViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image.asset(
              ImageAssets.curveImage,
              alignment: Alignment.topLeft,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("مبروك",
                    style: getBoldStyle(
                        color: ColorManager.green600, fontSize: 25.sp)),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "تم الدفع بنجاح !",
                  style: getBoldStyle(
                      color: ColorManager.black500, fontSize: 18.sp),
                ),
              ],
            ),
            SizedBox(
              height: 24.h,
            ),
            Stack(alignment: Alignment.center, children: [
              Image.asset(
                ImageAssets.verifiedCheck,
                height: 200.h,
                width: 242.w,
                fit: BoxFit.contain,
              ),
              Image.asset(
                ImageAssets.verifiedCheckIcon,
              )
            ]),
            SizedBox(
              height: 32.h,
            ),
            Padding(
              padding: const EdgeInsets.only(right: 16.0, bottom: 16),
              child: Text(
                "تفاصيل الدفع",
                style:
                    getMediumStyle(color: ColorManager.black500, fontSize: 22),
              ),
            ),
            const CustomPaymentDetailsContainer(
              title: 'الاسم',
              subTitle: 'جميلة حسين',
            ),
            const CustomPaymentDetailsContainer(
              title: 'التاريخ',
              subTitle: '٤ يناير ٢٠٢٥',
            ),
            const CustomPaymentDetailsContainer(
              title: 'الوقت',
              subTitle: '٤ يناير ٢٠٢٥',
            ),
            const CustomPaymentDetailsContainer(
              title: 'المبلغ المدفوع',
              subTitle: r'$250',
            ),
            Container(
              height: 50,
              margin: EdgeInsets.symmetric(horizontal: 16.w,vertical: 16.h),
              child: Directionality(
                textDirection: TextDirection.ltr,
                child: CustomElevatedButton(
                  title: "ابدا الان",
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, Routes.programmingView);
                  },
                  color: ColorManager.primary700,
                  textColor: ColorManager.white,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}


