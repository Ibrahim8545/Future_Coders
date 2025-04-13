import 'package:courseapp/core/utils/assets_manager.dart';
import 'package:courseapp/core/utils/color_manager.dart';
import 'package:courseapp/core/utils/components/build_box_decoration.dart';
import 'package:courseapp/core/utils/styles_manager.dart';
import 'package:courseapp/features/main/community/presentaion/widgets/custom_social_reactions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomQuestionsContainer extends StatefulWidget {
  const CustomQuestionsContainer({super.key});

  @override
  State<CustomQuestionsContainer> createState() => _CustomQuestionsContainerState();
}

class _CustomQuestionsContainerState extends State<CustomQuestionsContainer> {
  bool isFollowing = false;
  bool isClicked = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding:
      const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      decoration: buildBoxDecoration(),
      child: Column(
        children: [
          Row(
            children: [
              const CircleAvatar(
                backgroundImage: AssetImage(ImageAssets.avatars),
              ),
              SizedBox(
                width: 10.w,
              ),
              Column(
                children: [
                  Text(
                    "يوسف احمد",
                    style: getMediumStyle(
                        color: ColorManager.black500, fontSize: 18),
                  ),
                  Text("مصر/القاهرة",
                      style: getMediumStyle(
                          color: ColorManager.grey400,
                          fontSize: 14)),
                ],
              ),
              const Spacer(),
              GestureDetector(
                onTap: () {
                  setState(() {
                    isFollowing = !isFollowing;
                  });
                },
                child: Container(
                  height: 44.h,
                  width: 109.h,
                  decoration: BoxDecoration(
                    border: isFollowing
                        ? Border.all(color: ColorManager.primary700)
                        : Border.all(color: ColorManager.black500),
                    color: isFollowing
                        ? ColorManager.white
                        : ColorManager.black500,
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      isFollowing
                          ? Text(
                        "متابع",
                        style: getMediumStyle(
                            color: ColorManager.primary700),
                      )
                          : Text(
                        "متابعة",
                        style: getMediumStyle(
                            color: ColorManager.white),
                      ),
                      SizedBox(
                        width: 5.w,
                      ),
                      isFollowing
                          ? ImageIcon(
                          color: ColorManager.primary700,
                          AssetImage(
                            IconsAssets.followingIc,
                          ))
                          : ImageIcon(
                          color: ColorManager.white,
                          AssetImage(IconsAssets.userAddIc)),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: ColorManager.primary700,
                    borderRadius: BorderRadius.circular(5.r),
                  ),
                  child: Text(
                    "الأسئلة",
                    style:
                    getMediumStyle(color: ColorManager.white),
                  ),
                ),
                SizedBox(
                  width: 10.w,
                ),
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: ColorManager.green500,
                    borderRadius: BorderRadius.circular(5.r),
                  ),
                  child: Row(
                    children: [
                      Text(
                        "تم حلها",
                        style: getMediumStyle(
                            color: ColorManager.white),
                      ),
                      Icon(
                        Icons.check,
                        color: ColorManager.white,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Text(
            "أنا بحاول أكتب كود علشان أحرك الشخصية في اللعبة، بس مش بتتحرك! 😢 إيه الغلط اللي ممكن يكون في الكود، وإزاي أصلحه؟",
            style: getMediumStyle(color: ColorManager.black500),
          ),
          SizedBox(
            height: 10.h,
          ),
          Image.asset(ImageAssets.solveProblem),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      isClicked = !isClicked;
                    });
                  },
                  child: Row(
                    children: [
                      ImageIcon(
                        AssetImage(IconsAssets.likeIc),
                        color: isClicked
                            ? ColorManager.primary700
                            : ColorManager.black500,
                      ),
                      Text(
                        " 24 إعجاب",
                        style: getMediumStyle(
                            color: isClicked
                                ? ColorManager.primary700
                                : ColorManager.black500,
                            fontSize: 18),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: 10.w,
                ),
                CustomSocialReactions(
                  title: "8 التعليقات",
                  icon: IconsAssets.commentIc,
                ),
                SizedBox(
                  width: 10.w,
                ),
                CustomSocialReactions(
                  title: "مشاركة",
                  icon: IconsAssets.shareIc,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}