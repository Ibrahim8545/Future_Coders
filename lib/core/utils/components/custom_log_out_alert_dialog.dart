import 'package:courseapp/config/routes/routes.dart';
import 'package:courseapp/core/utils/assets_manager.dart';
import 'package:courseapp/core/utils/color_manager.dart';
import 'package:courseapp/core/utils/styles_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomLogOutAlertDialog extends StatelessWidget {
  const CustomLogOutAlertDialog({
    super.key, required this.content,
  });
  final String content;
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: ColorManager.white,
      title: Stack(
          alignment: Alignment.center,
          children: [
            Image.asset(ImageAssets.redImg),
            Image.asset(ImageAssets.exit),
          ]),
      content: Text(
        content,
        style: getMediumStyle(color: ColorManager.black500),
        textAlign: TextAlign.center,
      ),
      actions: [
        Directionality(
          textDirection:TextDirection.rtl,
          child: Row(
            children: [
              Expanded(
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, Routes.signIn);
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xffDD3434),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4),
                      )),
                  child: Text(
                    "تأكيد",
                    style:
                    getMediumStyle(color: ColorManager.white),
                  ),
                ),
              ),
              SizedBox(
                width: 5.w,
              ),
              Expanded(
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: ColorManager.white,
                        shape: RoundedRectangleBorder(
                            borderRadius:
                            BorderRadius.circular(4),
                            side: const BorderSide(
                                color: Color(0xffDD3434)))),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text("إلغاء",
                        style: getMediumStyle(
                            color: ColorManager.black500))),
              )
            ],
          ),
        )
      ],
    );
  }
}
