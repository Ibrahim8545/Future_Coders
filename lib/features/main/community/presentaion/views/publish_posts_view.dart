import 'package:courseapp/core/utils/assets_manager.dart';
import 'package:courseapp/core/utils/color_manager.dart';
import 'package:courseapp/core/utils/styles_manager.dart';
import 'package:courseapp/features/main/settings/presentation/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PublishPostsView extends StatelessWidget {
  const PublishPostsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        clipBehavior: Clip.none,
        children: [
          Positioned(
            top: 65.h,
            left: 60.w,
            child: Row(
              children: [
                const CircleAvatar(
                  radius: 15,
                  backgroundImage: AssetImage(
                    ImageAssets.avatars,
                  ),
                ),
                Row(
                  children: [
                    Text(
                      "  يوسف احمد",
                      style: getMediumStyle(
                          color: ColorManager.black500, fontSize: 18),
                    ),
                    SizedBox(
                      width: 149.w,
                    ),
                    Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: ColorManager.primary700,
                        borderRadius: BorderRadius.circular(5.r),
                      ),
                      child: Text(
                        "نشر",
                        style: getMediumStyle(color: ColorManager.white),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0,vertical: 16),
            child: Column(
              children: [
                const Expanded(child: SizedBox()),
                Row(
                  children: [
                    CircleAvatar(
                      backgroundColor: ColorManager.primary700,
                      child: Icon(
                        Icons.mic_rounded,
                        color: ColorManager.white,
                      ),
                    ),
                    SizedBox(width: 10.w,),
                    Expanded(
                      child:
                      TextFormField(
                        textDirection: TextDirection.rtl,
                        cursorColor: ColorManager.primary700,
                        decoration: InputDecoration(
                          hintTextDirection: TextDirection.rtl,
                          hintText: "اكتب هنا....",
                          filled: true,
                          fillColor: Colors.white,
                          prefixIcon: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [

                              IconButton(
                                icon: const Icon(Icons.link, color: Colors.grey),
                                onPressed: () {}, // Add functionality here
                              ),
                              IconButton(
                                icon: const Icon(Icons.camera_alt, color: Colors.grey),
                                onPressed: () {}, // Add functionality here
                              ),
                            ],
                          ),
                          suffixIcon: Image.asset(IconsAssets.icPen,),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide.none,
                          ),
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
          const CustomAppBar()
        ],
      ),
    );
  }
}
