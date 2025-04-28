import 'dart:io';
import 'package:courseapp/core/utils/assets_manager.dart';
import 'package:courseapp/core/utils/color_manager.dart';
import 'package:courseapp/core/utils/styles_manager.dart';
import 'package:courseapp/features/main/community/presentaion/manager/post_provider.dart';
import 'package:courseapp/features/main/settings/presentation/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class PublishPostsView extends StatefulWidget {
  const PublishPostsView({super.key});

  @override
  State<PublishPostsView> createState() => _PublishPostsViewState();
}

class _PublishPostsViewState extends State<PublishPostsView> {
  TextEditingController controller = TextEditingController();
  String newText = "";
  File? _selectedImage;
  bool _isLoading = false;

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
                      "  محمد اشرف",
                      style: getMediumStyle(
                          color: ColorManager.black500, fontSize: 18),
                    ),
                    SizedBox(
                      width: 149.w,
                    ),
                    GestureDetector(
                      onTap: _isLoading
                          ? null
                          : () async {
                        if (newText.isNotEmpty) {
                          setState(() {
                            _isLoading = true;
                          });

                          // Add post to provider
                          try {
                            await Provider.of<PostsProvider>(context, listen: false)
                                .addPost(newText, _selectedImage);

                            if (mounted) {
                              // Clear the form and navigate back
                              setState(() {
                                controller.clear();
                                newText = "";
                                _selectedImage = null;
                                _isLoading = false;
                              });
                              Navigator.pop(context);
                            }
                          } catch (e) {
                            setState(() {
                              _isLoading = false;
                            });
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text('فشل في نشر المنشور')),
                            );
                          }
                        }
                      },
                      child: Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: newText.isEmpty || _isLoading
                              ? ColorManager.grey1
                              : ColorManager.primary700,
                          borderRadius: BorderRadius.circular(5.r),
                        ),
                        child: _isLoading
                            ? SizedBox(
                          width: 20,
                          height: 20,
                          child: CircularProgressIndicator(
                            color: ColorManager.white,
                            strokeWidth: 2,
                          ),
                        )
                            : Text(
                          "نشر",
                          style: getMediumStyle(color: ColorManager.white),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16),
            child: Column(
              children: [
                SizedBox(height: 130.h),
                Expanded(
                  child: Directionality(
                    textDirection: TextDirection.rtl,
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            newText,
                            style: getMediumStyle(color: ColorManager.black500),
                          ),
                          const SizedBox(height: 20),
                          _selectedImage != null
                              ? Stack(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(8),
                                child: Image.file(
                                  _selectedImage!,
                                  height: 200,
                                  width: double.infinity,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Positioned(
                                top: 8,
                                right: 8,
                                child: GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      _selectedImage = null;
                                    });
                                  },
                                  child: Container(
                                    padding: const EdgeInsets.all(4),
                                    decoration: BoxDecoration(
                                      color: Colors.black.withOpacity(0.7),
                                      shape: BoxShape.circle,
                                    ),
                                    child: Icon(
                                      Icons.close,
                                      color: ColorManager.white,
                                      size: 18,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          )
                              : const SizedBox(),
                        ],
                      ),
                    ),
                  ),
                ),
                Row(
                  children: [
                    CircleAvatar(
                      backgroundColor: ColorManager.primary700,
                      child: Icon(
                        Icons.mic_rounded,
                        color: ColorManager.white,
                      ),
                    ),
                    SizedBox(width: 10.w),
                    Expanded(
                      child: TextFormField(
                        onChanged: (value) {
                          setState(() {
                            newText = value;
                          });
                        },
                        controller: controller,
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
                                onPressed: _pickImageFromGallery,
                              ),
                              IconButton(
                                icon: const Icon(Icons.camera_alt, color: Colors.grey),
                                onPressed: _pickImageFromCamera,
                              ),
                            ],
                          ),
                          suffixIcon: Image.asset(IconsAssets.icPen),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide.none,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
          const CustomAppBar()
        ],
      ),
    );
  }

  Future _pickImageFromGallery() async {
    final returnedImage = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (returnedImage == null) return;
    setState(() {
      _selectedImage = File(returnedImage.path);
    });
  }

  Future _pickImageFromCamera() async {
    final returnedImage = await ImagePicker().pickImage(source: ImageSource.camera);
    if (returnedImage == null) return;
    setState(() {
      _selectedImage = File(returnedImage.path);
    });
  }
}