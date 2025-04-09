import 'package:courseapp/core/utils/assets_manager.dart';
import 'package:courseapp/core/utils/color_manager.dart';
import 'package:courseapp/core/utils/styles_manager.dart';
import 'package:courseapp/features/main/settings/presentation/widgets/custom_app_bar.dart';
import 'package:courseapp/features/main/settings/presentation/widgets/custom_app_bar_title.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FullArticleViewBody extends StatelessWidget {
  const FullArticleViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Stack(
        children: [
          Column(
            children: [
              const CustomRowAppBarTitle(
                title: "المقالات",
              ),
              SizedBox(height: 30.h),
              Stack(
                clipBehavior: Clip.none,
                children: [
                  Container(
                    width: double.infinity,
                    height: 243,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(ImageAssets.articleImage),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Positioned(
                    left: 10,
                    bottom: -20,
                    child: CircleAvatar(
                      backgroundColor: ColorManager.primary700,
                      child: Icon(
                        Icons.favorite_border,
                        color: ColorManager.white,
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(height: 30.h),
              Directionality(
                textDirection: TextDirection.rtl,
                child: Row(
                  children: [
                    SizedBox(
                      width: 16.w,
                    ),
                    CircleAvatar(
                      child: Image.asset(ImageAssets.writerImage),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 12.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "يوفال نوح هراري",
                            style: getMediumStyle(
                                color: ColorManager.primary700, fontSize: 18),
                          ),
                          Text(
                            "منذ 12 ساعة",
                            style: getMediumStyle(
                                color: ColorManager.grey400, fontSize: 14),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(height: 20.h,),
              Text(
                "لماذا البرمجة مهمة اليوم وفي المستقبل؟",
                style: getBoldStyle(
                  color: ColorManager.red600,
                  fontSize: 22,
                ),
              ),
              Directionality(
                  textDirection: TextDirection.rtl,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16.0, vertical: 16),
                    child: Text(
                      "في العصر الرقمي، لم تعد البرمجة مجرد مهارة تقنية، بل أصبحت لغة العصر الحديث، تمامًا مثلما كانت القراءة والكتابة حجر الأساس للحضارات السابقة. كما غيّرت الثورة الصناعية طبيعة العمل، فإن الثورة الرقمية اليوم تُعيد تشكيل العالم من حولنا، وستحدد البرمجة مستقبل المجتمعات والاقتصادات وحتى هويات الأفراد.البرمجة كقوة محركة للمستقبلخلال الألفيات الماضية، امتلك البشر القدرة على ترويض الطبيعة، بناء المدن، وخلق الحضارات. لكن اليوم، القوة الأعظم تكمن في فهم الخوارزميات، التي أصبحت تتحكم في التجارة، الإعلام، وحتى القرارات السياسية. كل تطبيق على هاتفك، وكل عملية شراء عبر الإنترنت، وكل خبر تقرؤه، تحكمه أسطر من الشفرات البرمجية التي تحدد ما تراه وما لا تراه.إن الأتمتة والذكاء الاصطناعي ليست مجرد تقنيات مساعدة، بل قوى قادرة على إعادة تشكيل القوى العاملة والمجتمع. الوظائف التقليدية آخذة في الاختفاء، في حين تتزايد الحاجة إلى وظائف جديدة تعتمد على البرمجة، من تحليل البيانات إلى تطوير الذكاء الاصطناعي.هل يجب على الجميع تعلم البرمجة؟ليس بالضرورة أن يصبح الجميع مبرمجين، تمامًا كما لا يحتاج الجميع إلى أن يكونوا روائيين رغم أهمية القراءة والكتابة. لكن في عالم تهيمن عليه الخوارزميات، فإن من لا يفهم أساسيات البرمجة سيكون في وضع أضعف، حيث ستتم إدارة حياته من قبل أنظمة لا يفهمها ولا يستطيع التأثير عليها.",
                      style:getMediumStyle(color: ColorManager.black500),),
                  ))
            ],
          ),
          const CustomAppBar()
        ],
      ),
    );
  }
}
