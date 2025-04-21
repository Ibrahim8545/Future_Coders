import 'dart:io';
import 'package:courseapp/core/utils/assets_manager.dart';
import 'package:courseapp/core/utils/color_manager.dart';
import 'package:courseapp/core/utils/styles_manager.dart';
import 'package:courseapp/features/main/community/presentaion/manager/post_cubit.dart';
import 'package:courseapp/features/main/community/presentaion/manager/post_state.dart';
import 'package:courseapp/features/main/settings/presentation/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';

class PublishPostsView extends StatefulWidget {
  const PublishPostsView({super.key});

  @override
  State<PublishPostsView> createState() => _PublishPostsViewState();
}

class _PublishPostsViewState extends State<PublishPostsView> {
  TextEditingController controller = TextEditingController();
  String newText = "";
  File? _selectedImage;
  bool _isPosting = false;

  @override
  Widget build(BuildContext context) {
    return BlocListener<PostCubit, PostState>(
      listener: (context, state) {
        if (state is PostLoading) {
          setState(() {
            _isPosting = true;
          });
        } else if (state is PostCreationSuccess) {
          setState(() {
            _isPosting = false;
            controller.clear();
            newText = "";
            _selectedImage = null;
          });
          Navigator.pop(context);
        } else if (state is PostCreationFailure) {
          setState(() {
            _isPosting = false;
          });
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('فشل في نشر المنشور: ${state.message}')),
          );
        }
      },
      child: Scaffold(
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
                      GestureDetector(
                        onTap: _isPosting
                            ? null
                            : () {
                          if (newText.isNotEmpty) {
                            context.read<PostCubit>().addPost(
                              text: newText,
                              image: _selectedImage,
                            );
                          }
                        },
                        child: Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: _isPosting || newText.isEmpty
                                ? ColorManager.grey1
                                : ColorManager.primary700,
                            borderRadius: BorderRadius.circular(5.r),
                          ),
                          child: _isPosting
                              ? SizedBox(
                            width: 16,
                            height: 16,
                            child: CircularProgressIndicator(
                              strokeWidth: 2,
                              color: ColorManager.white,
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
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            newText,
                            textAlign: TextAlign.start,
                            style: getMediumStyle(color: ColorManager.black500),
                          ),
                          const SizedBox(height: 20),
                          _selectedImage != null
                              ? ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Stack(
                              children: [
                                Image.file(
                                  _selectedImage!,
                                  fit: BoxFit.cover,
                                  width: double.infinity,
                                  height: 200,
                                ),
                                Positioned(
                                  right: 5,
                                  top: 5,
                                  child: GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        _selectedImage = null;
                                      });
                                    },
                                    child: Container(
                                      padding: const EdgeInsets.all(4),
                                      decoration: BoxDecoration(
                                        color: Colors.black.withOpacity(0.6),
                                        shape: BoxShape.circle,
                                      ),
                                      child: const Icon(
                                        Icons.close,
                                        color: Colors.white,
                                        size: 16,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          )
                              : const SizedBox(),
                        ],
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
                                  onPressed: () {
                                    _pickImageFromGallery();
                                  },
                                ),
                                IconButton(
                                  icon: const Icon(Icons.camera_alt, color: Colors.grey),
                                  onPressed: () {
                                    _pickImageFromCamera();
                                  },
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