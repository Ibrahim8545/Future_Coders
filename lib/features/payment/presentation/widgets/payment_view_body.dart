import 'package:courseapp/config/routes/routes.dart';
import 'package:courseapp/core/utils/assets_manager.dart';
import 'package:courseapp/core/utils/color_manager.dart';
import 'package:courseapp/core/utils/styles_manager.dart';
import 'package:courseapp/features/auth/prestation/widget/custom_buttom.dart';
import 'package:courseapp/features/main/settings/presentation/widgets/custom_app_bar.dart';
import 'package:courseapp/features/payment/data/model/payment_option.dart';
import 'package:courseapp/features/payment/presentation/widgets/payment_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PaymentViewBody extends StatefulWidget {
  const PaymentViewBody({super.key});

  @override
  State<PaymentViewBody> createState() => _PaymentViewBodyState();
}

class _PaymentViewBodyState extends State<PaymentViewBody> {
  String? selectedMethod = 'فيزا';

  final List<PaymentOption> options = [
    PaymentOption(title: 'فيزا', imagePath: ImageAssets.credit),
    PaymentOption(title: 'كاش', imagePath: ImageAssets.cash),
    PaymentOption(title: 'فودافون كاش', imagePath: ImageAssets.vodafone),
    PaymentOption(title: 'تقسيط', imagePath: ImageAssets.cash),
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              SizedBox(
                height: 70.h,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      'طرق الدفع',
                      style: getBoldStyle(color: Colors.black),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 4.h,
              ),
              Padding(
                padding:  EdgeInsets.symmetric(horizontal: 16.0.w),
                child: Text(
                  'اختر طريقة الدفع التي تفضلها',
                  style: getLightStyle(color: const Color(0xff999999))
                      .copyWith(fontSize: 14.sp),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    ...options.map((option) => PaymentCard(
                          option: option,
                          isSelected: selectedMethod == option.title,
                          onTap: () {
                            setState(() {
                              selectedMethod = option.title;
                            });
                          },
                        )),
                    SizedBox(height: 30.h,),
                    CustomButton(
                      onTap: () {
                        final selectedOption = options.firstWhere(
                              (option) => option.title == selectedMethod,
                          orElse: () => options[0],
                        );

                        Navigator.pushNamed(
                          context,
                          Routes.selectedPayment,
                          arguments: selectedOption,
                        );
                      },
                      text: "استمر",
                      color: ColorManager.primary700,
                    )
                  ],
                ),
              ),
            ],
          ),
          const CustomAppBar()
        ],
      ),
    );
  }
}


