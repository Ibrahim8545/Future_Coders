import 'package:courseapp/core/utils/assets_manager.dart';
import 'package:courseapp/core/utils/color_manager.dart';
import 'package:courseapp/core/utils/components/build_box_decoration.dart';
import 'package:courseapp/core/utils/styles_manager.dart';
import 'package:courseapp/features/main/community/data/models/post_model.dart';
import 'package:courseapp/features/main/community/presentaion/widgets/custom_social_reactions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomQuestionsContainer extends StatelessWidget {
  final PostModel post;

  const CustomQuestionsContainer({super.key, required this.post});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: buildBoxDecoration(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const CircleAvatar(
                backgroundImage: AssetImage(ImageAssets.avatars),
              ),
              SizedBox(width: 10.w),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("مستخدم", style: getMediumStyle(color: ColorManager.black500)),
                  Text("من Supabase", style: getMediumStyle(color: ColorManager.grey400, fontSize: 12)),
                ],
              ),
            ],
          ),
          const SizedBox(height: 12),
          if (post.text.isNotEmpty)
            Text(
              post.text,
              style: getMediumStyle(color: ColorManager.black500),
              textDirection: TextDirection.rtl,
            ),
          const SizedBox(height: 12),
          if (post.imageUrl.isNotEmpty)
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.network(post.imageUrl),
            ),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomSocialReactions(
                title: "تعليق",
                icon: IconsAssets.commentIc,
              ),
              CustomSocialReactions(
                title: "مشاركة",
                icon: IconsAssets.shareIc,
              ),
            ],
          )
        ],
      ),
    );
  }
}
