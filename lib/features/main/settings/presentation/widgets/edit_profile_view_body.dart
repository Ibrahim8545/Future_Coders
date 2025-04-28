import 'dart:io';
import 'package:courseapp/core/utils/values_manager.dart';
import 'package:courseapp/features/auth/data/repo_imp/signup_repo_imp.dart';
import 'package:courseapp/features/auth/domain/use_case/signup_usecase.dart';
import 'package:courseapp/features/auth/prestation/manager/cubit/signup_bloc_cubit.dart';
import 'package:courseapp/features/auth/prestation/widget/custom_buttom.dart';
import 'package:courseapp/features/main/settings/presentation/widgets/custom_app_bar.dart';
import 'package:courseapp/features/main/settings/presentation/widgets/custom_circle_avatar_profile_photo.dart';
import 'package:courseapp/features/main/settings/presentation/widgets/custom_profile_name_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'custom_app_bar_title.dart';

class EditProfileViewBody extends StatefulWidget {
  const EditProfileViewBody({super.key});

  @override
  State<EditProfileViewBody> createState() => _EditProfileViewBodyState();
}

class _EditProfileViewBodyState extends State<EditProfileViewBody> {
  File? selectedImage;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthCubit(
          signUpUseCase: SignUpUseCase(
              AuthRepositoryImpl(client: Supabase.instance.client)),
          authRepository: AuthRepositoryImpl(client: Supabase.instance.client)),
      child: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const CustomRowAppBarTitle(
                title: "تعديل الملف الشخضي",
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * .2,
              ),
              GestureDetector(
                onTap: () {
                  pickImageFromGallery();
                },
                child: CustomCircleAvatarProfilePhoto(
                  selectedImage: selectedImage,
                ),
              ),
              const SizedBox(height: AppSize.s24),
              CustomProfileNameWidget(),
              const SizedBox(height: AppSize.s40),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: AppPadding.p20),
                child: CustomButton(
                  color: const Color(0xff0A638F),
                  onTap: () {},
                  text: "البريد الالكتروني",
                ),
              ),
              const SizedBox(height: AppSize.s12),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: AppPadding.p20),
                child: CustomButton(
                    color: const Color(0xff0A638F),
                    onTap: () {},
                    text: "كلمه المرور"),
              ),
            ],
          ),
          const CustomAppBar(),
        ],
      ),
    );
  }

  Future pickImageFromGallery() async {
    final supabase = Supabase.instance.client;

    final returnedImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (returnedImage == null) return;

    setState(() {
      selectedImage = File(returnedImage.path);
    });

    final imageBytes = await selectedImage!.readAsBytes();
    final userId = supabase.auth.currentUser!.id;
    final fileExtension = returnedImage.path.split('.').last;
    final fileName = 'profile_image.$fileExtension';
    final imagePath = '$userId/profiles/$fileName';

    try {
      await supabase.storage.from('profiles').uploadBinary(
            imagePath,
            imageBytes,
            fileOptions: FileOptions(
              contentType: fileExtension == 'png' ? 'image/png' : 'image/jpeg',
              upsert: true,
            ),
          );

      final imageUrl =
          supabase.storage.from('profiles').getPublicUrl(imagePath);
      debugPrint('Uploaded image URL: $imageUrl');

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('تم رفع الصورة بنجاح')),
      );
    } catch (e) {
      debugPrint('Error uploading image: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('حدث خطأ أثناء رفع الصورة')),
      );
    }
  }
}
