import 'dart:io';
import 'package:courseapp/core/utils/assets_manager.dart';
import 'package:courseapp/core/utils/color_manager.dart';
import 'package:courseapp/core/utils/styles_manager.dart';
import 'package:courseapp/features/main/settings/presentation/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
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
  File? _selectedImages;
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
                    GestureDetector(
                      onTap: (){
                        setState(() {
                          newText = controller.text;
                        });
                      },
                      child: Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: newText.length==0?ColorManager.grey1:ColorManager.primary700,
                          borderRadius: BorderRadius.circular(5.r),
                        ),
                        child: Text(
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
            padding: const EdgeInsets.symmetric(horizontal: 16.0,vertical: 16),
            child: Column(
              children: [
                SizedBox(height: 130.h,),
                 Expanded(
                   child: Directionality(
                     textDirection: TextDirection.rtl,
                     child: Column(
                      children: [
                         Text(textAlign: TextAlign.start,newText,style: getMediumStyle(color: ColorManager.black500),),
                        const SizedBox(height: 20,),
                        _selectedImages != null?Image.file(_selectedImages!):const SizedBox(),
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
                    SizedBox(width: 10.w,),
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
                                }, // Add functionality here
                              ),
                              IconButton(
                                icon: const Icon(Icons.camera_alt, color: Colors.grey),
                                onPressed: () {
                                  _pickImageFromCamera();
                                }, // Add functionality here
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
                ),

              ],
            ),
          ),
          const CustomAppBar()
        ],
      ),
    );
  }

  Future _pickImageFromGallery()async{
   final returnedImage =  await ImagePicker().pickImage(source: ImageSource.gallery);
   if(returnedImage==null)return;
   setState(() {
     _selectedImages = File(returnedImage.path);
   });
  }
  Future _pickImageFromCamera()async{
   final returnedImage =  await ImagePicker().pickImage(source: ImageSource.camera);
   if(returnedImage==null)return;
   setState(() {
     _selectedImages = File(returnedImage.path);
   });
  }
}
