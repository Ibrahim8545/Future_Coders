import 'package:courseapp/core/utils/assets_manager.dart';
import 'package:courseapp/core/utils/color_manager.dart';
import 'package:courseapp/core/utils/styles_manager.dart';
import 'package:courseapp/core/utils/values_manager.dart';
import 'package:courseapp/features/auth/prestation/widget/custom_buttom.dart';
import 'package:flutter/material.dart';
import 'custom_row_following_and_followers.dart';

class ProfileViewBody extends StatefulWidget {
  const ProfileViewBody({super.key});

  @override
  State<ProfileViewBody> createState() => _ProfileViewBodyState();
}

class _ProfileViewBodyState extends State<ProfileViewBody> {
  // late TooltipBehavior _tooltipBehavior;

  @override
  void initState() {
    //_tooltipBehavior = TooltipBehavior(enable: true);
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
                "احمد محمد",
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
                  child: Text('NO data')
                  //CustomSyncFusionCharts(tooltipBehavior: _tooltipBehavior),
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
