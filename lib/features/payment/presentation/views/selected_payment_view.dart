import 'package:courseapp/core/utils/styles_manager.dart';
import 'package:courseapp/features/auth/prestation/widget/custom_textfield.dart';
import 'package:courseapp/features/main/settings/presentation/widgets/custom_app_bar.dart';
import 'package:courseapp/features/payment/data/model/payment_option.dart';
import 'package:courseapp/features/payment/data/repos/checkout_repo_impl.dart';
import 'package:courseapp/features/payment/presentation/manager/cubit/payment_cubit.dart';
import 'package:courseapp/features/payment/presentation/widgets/custom_button_bloc_consumer.dart';
import 'package:courseapp/features/payment/presentation/widgets/payment_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SelectedPaymentScreen extends StatelessWidget {
  SelectedPaymentScreen({super.key, required this.option});

  final PaymentOption option;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final TextEditingController nameController = TextEditingController();
  final TextEditingController creditNumber = TextEditingController();
  final TextEditingController codeNumber = TextEditingController();
  final TextEditingController date = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PaymentCubit(
        CheckoutRepoImpl(),
      ),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Stack(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: Form(
                  key: formKey,
                  child: Column(
                    children: [
                      SizedBox(height: 70.h),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              '${"الدفع باستخدام ${option.title}"}',
                              style: getBoldStyle(color: Colors.black),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 12.0.h),
                        child: Image.asset(
                          option.imagePath,
                          height: 280.h,
                          fit: BoxFit.fitWidth,
                        ),
                      ),
                      const SizedBox(height: 20),
                      PaymentData(
                        paymentData: "الاسم الموجود على الفيزا",
                        size: 18.sp,
                      ),
                      CustomTextField(
                        controller: nameController,
                        hint: "الاسم الموجود على الفيزا",
                        hintText: "ادخل اسمك",
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return 'من فضلك أدخل الاسم';
                          }
                          return null;
                        },
                      ),
                      PaymentData(
                        paymentData: "رقم الفيزا",
                        size: 18.sp,
                      ),
                      CustomTextField(
                        controller: creditNumber,
                        hint: "رقم الفيزا",
                        hintText: "0000-0000-0000-0000",
                        keyboardType: TextInputType.number,
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return 'من فضلك أدخل رقم الفيزا';
                          } else if (value
                                  .replaceAll(RegExp(r'[^0-9]'), '  ')
                                  .length !=
                              16) {
                            return 'رقم الفيزا يجب أن يكون 16 رقمًا';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 12.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          PaymentData(
                            paymentData: "تاريخ انتهاء الصلاحية",
                            size: 14.sp,
                          ),
                          PaymentData(
                            paymentData: "كود التحقق",
                            size: 14.sp,
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: CustomTextField(
                              controller: date,
                              keyboardType: TextInputType.number,
                              hint: "تاريخ انتهاء الصلاحية",
                              hintText: "00/00",
                              validator: (value) {
                                if (value == null || value.trim().isEmpty) {
                                  return 'أدخل تاريخ الانتهاء';
                                } else if (!RegExp(
                                        r'^(0[1-9]|1[0-2])\/?([0-9]{2})$')
                                    .hasMatch(value)) {
                                  return 'التاريخ غير صالح (مثال: 12/25)';
                                }
                                return null;
                              },
                            ),
                          ),
                          SizedBox(width: 12.w),
                          Expanded(
                            child: CustomTextField(
                              controller: codeNumber,
                              keyboardType: TextInputType.number,
                              hint: "الكود",
                              hintText: "000",
                              validator: (value) {
                                if (value == null || value.trim().isEmpty) {
                                  return 'أدخل كود التحقق';
                                } else if (value.length < 3 ||
                                    value.length > 4) {
                                  return 'الكود يجب أن يكون 3 أو 4 أرقام';
                                }
                                return null;
                              },
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 25.h),
                      CustomButtonBlocConsumer(formKey: formKey)
                    ],
                  ),
                ),
              ),
              const CustomAppBar()
            ],
          ),
        ),
      ),
    );
  }
}

