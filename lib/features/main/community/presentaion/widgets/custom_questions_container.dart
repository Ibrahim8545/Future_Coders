import 'dart:io';
import 'package:courseapp/core/utils/assets_manager.dart';
import 'package:courseapp/core/utils/color_manager.dart';
import 'package:courseapp/core/utils/styles_manager.dart';
import 'package:courseapp/features/main/community/data/models/post_model.dart';
import 'package:courseapp/features/main/community/presentaion/widgets/custom_social_reactions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomQuestionsContainer extends StatelessWidget {
  final Post post;
  final VoidCallback? onDelete;

  const CustomQuestionsContainer({
    super.key,
    required this.post,
    this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: ColorManager.primary700, width: 2),
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const CircleAvatar(
                radius: 20,
                backgroundImage: AssetImage(ImageAssets.avatars),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "محمد اشرف",
                      style: getBoldStyle(
                          color: ColorManager.black500, fontSize: 16.sp),
                    ),
                    Text(
                      "مصر/القاهرة",
                      style: getBoldStyle(
                          color: ColorManager.grey400, fontSize: 14.sp),
                    ),
                  ],
                ),
              ),
              if (onDelete != null)
                IconButton(
                  icon: Icon(Icons.delete, color: ColorManager.error),
                  onPressed: onDelete,
                ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Container(
                  height: 44,
                  padding: const EdgeInsets.all(10),
                  decoration: ShapeDecoration(
                    color: ColorManager.primary700,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8)),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    spacing: 10,
                    children: [
                      Text(
                        'الأسئلة',
                        style: getMediumStyle(color: ColorManager.white),
                      ),
                    ],
                  ),
                ),
                SizedBox(width: 10.w),
                Container(
                  height: 44,
                  padding: const EdgeInsets.all(10),
                  decoration: ShapeDecoration(
                    color: ColorManager.green500,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8)),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    spacing: 10,
                    children: [
                      Text(
                        'الأسئلة',
                        style: getMediumStyle(color: ColorManager.white),
                      ),
                      Icon(
                        Icons.check,
                        color: ColorManager.white,
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          Text(
            post.text,
            style: getRegularStyle(color: ColorManager.black500, fontSize: 16),
          ),
          if (post.imageUrl != null) ...[
            const SizedBox(height: 16),
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: post.imageUrl!.startsWith('http')
                  ? Image.network(
                      post.imageUrl!,
                      height: 200,
                      width: double.infinity,
                      fit: BoxFit.cover,
                      loadingBuilder: (context, child, loadingProgress) {
                        if (loadingProgress == null) return child;
                        return Center(
                          child: CircularProgressIndicator(
                            value: loadingProgress.expectedTotalBytes != null
                                ? loadingProgress.cumulativeBytesLoaded /
                                    loadingProgress.expectedTotalBytes!
                                : null,
                          ),
                        );
                      },
                      errorBuilder: (context, error, stackTrace) {
                        return Container(
                          height: 200,
                          width: double.infinity,
                          color: Colors.grey[300],
                          child: const Center(
                            child: Icon(Icons.error_outline, size: 50),
                          ),
                        );
                      },
                    )
                  : Image.file(
                      File(post.imageUrl!),
                      height: 200,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
            ),
          ],
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CustomSocialReactions(icon: IconsAssets.likeIc, title: "اعجاب"),
              CustomSocialReactions(
                  icon: IconsAssets.commentIc, title: 'تعليق'),
              CustomSocialReactions(icon: IconsAssets.shareIc, title: 'مشاركة'),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildActionButton(IconData icon, String label) {
    return InkWell(
      onTap: () {},
      child: Row(
        children: [
          Icon(icon, size: 18, color: ColorManager.grey400),
          const SizedBox(width: 4),
          Text(
            label,
            style: getRegularStyle(color: ColorManager.grey400, fontSize: 14),
          ),
        ],
      ),
    );
  }
}
