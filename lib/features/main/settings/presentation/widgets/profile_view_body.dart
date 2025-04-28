import 'package:courseapp/config/routes/routes.dart';
import 'package:courseapp/core/utils/assets_manager.dart';
import 'package:courseapp/core/utils/color_manager.dart';
import 'package:courseapp/core/utils/styles_manager.dart';
import 'package:courseapp/core/utils/values_manager.dart';
import 'package:courseapp/features/auth/prestation/widget/custom_buttom.dart';
import 'package:courseapp/features/main/settings/presentation/widgets/custom_sync_fusion_charts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import 'custom_row_following_and_followers.dart';

class ProfileViewBody extends StatefulWidget {
  const ProfileViewBody({super.key});

  @override
  State<ProfileViewBody> createState() => _ProfileViewBodyState();
}

class _ProfileViewBodyState extends State<ProfileViewBody> {
  late TooltipBehavior _tooltipBehavior;

  @override
  void initState() {
     _tooltipBehavior = TooltipBehavior(enable: true);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Stack(
        children: [
          Column(
            children: [
              const SizedBox(height: AppSize.s50),
              CircleAvatar(
                backgroundColor: Colors.deepOrangeAccent,
                radius: 70,
                child: Image.asset(ImageAssets.igProfile),
              ),
              const SizedBox(height: AppSize.s8),
              Text(
                "محمد اشرف",
                style: getBoldStyle(color: ColorManager.black500),
              ),
              const SizedBox(height: AppSize.s20),
              Text(
                "المستوي",
                style: getSemiBoldStyle(color: ColorManager.black500),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: AppPadding.p8, vertical: AppPadding.p12),
                child: CustomButton(
                    color: const Color(0xff0A638F),
                    onTap: () {},
                    text: "اضف صديق +"),
              ),
              const CustomRowFollowingAndFollowers(),
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: AppPadding.p8, vertical: AppPadding.p20),
                child: CustomButton(
                    color: const Color(0xff0A638F),
                    onTap: () {},
                    text: "مستوي تقدم الطالب "),
              ),
              Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: AppPadding.p8, vertical: AppPadding.p20),
                  child:
                  CustomSyncFusionCharts(tooltipBehavior: _tooltipBehavior),
                  ),
              Container(
                margin: const EdgeInsets.symmetric(
                    horizontal: AppPadding.p8, vertical: AppPadding.p8),
                height: 186.h,
                decoration: BoxDecoration(
                  color: ColorManager.primary100,
                  borderRadius: BorderRadius.circular(AppSize.s8.r),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "وقت التعلم الاسبوعي",
                      style: getSemiBoldStyle(color: ColorManager.black500),
                    ),
                    Text(
                      "عدد ساعات و عدد دقائق",
                      style: getMediumStyle(
                          color: ColorManager.black500, fontSize: 16),
                    ),
                    Text("استمر في التعلم !",
                        style: getMediumStyle(
                            color: ColorManager.red600, fontSize: 14)),
                    CustomButton(
                        color: ColorManager.primary700,
                        onTap: () {
                          Navigator.pushNamed(context, Routes.progressView);
                        },
                        text: "عرض الجدول"),
                  ],
                ),
              )
            ],
          ),
          Image.asset(ImageAssets.curveImage),
          Padding(
            padding: const EdgeInsets.only(top: AppPadding.p20),
            child: GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Image.asset(
                  IconsAssets.arrowBack,
                )),
          ),
        ],
      ),
    );
  }
}
