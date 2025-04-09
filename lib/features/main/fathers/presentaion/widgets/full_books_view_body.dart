import 'package:courseapp/core/utils/assets_manager.dart';
import 'package:courseapp/core/utils/styles_manager.dart';
import 'package:courseapp/features/main/settings/presentation/widgets/custom_app_bar.dart';
import 'package:courseapp/features/main/settings/presentation/widgets/custom_app_bar_title.dart';
import 'package:flutter/material.dart';

class FullBooksViewBody extends StatelessWidget {
  const FullBooksViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Stack(
        children: [
          Column(
            children: [
              const CustomRowAppBarTitle(title: "دليلك لتعليم طفلك"),
              Padding(
                padding: const EdgeInsets.all(25.0),
                child: Image.asset(ImageAssets.imageBook),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Text(
                  textAlign: TextAlign.center,
                  style: getMediumStyle(color: Colors.black,fontSize: 20,),
                    "نرى العالم بأسره كيف تحول تحولا جذريا في ظل التقدم التكنولوجي الهائل الذي نعيشه، حيث تطغى التكنولوجيا على مختلف جوانب حياتنا اليومية، وفي هذا السياق الملهم، يتسارع الاهتمام نحو فهم عميق وشامل لعلوم الحاسوب والبرمجة والذكاء الاصطناعي، وهو ما يلقى قاعدة أساسية في تأسيس مستقبل يعتمد بشكل كبير على التقنية.لذلك إن إعداد أبنائنا لمواكبة هذا التطور يعد أمرا مهما وحيويا، ولهذا الأمر يصعب على أولياء الأمر معرفة كيف البدء في تعليم أطفالهم هذا المجال أو معرفة الفوائد التي سوف يكتسبونها أو ماهو المناسب لفئة طفلهم العمرية لذلك كنوع من المبادرة بعد أن أقيمت الورشة المقدمة من نادي نهج الذكاء الاصطناعي بعنوان كيفية إعداد طفلك لمستقبل مشرق في عالم البرمجة والذكاء الاصطناعي نطلق لكم دليل إرشادي يجمع ما هو الأنسب لأطفالكم وما نصحت به الدراسات في تعليم البرمجة والذكاء الاصطناعي لأطفالكم في سن مبكرة، حيث يتسنى لطفلكم تكوين أساس قوي في عالم الحوسبة من خلال الألعاب والأنشطة الممتعة. فإن في هذا الدليل، ستجدون إشارات ضوء تنير لكم الطريق في فهم كيفية توجيه انتباه الأطفال نحو فهم أساسيات البرمجة وتحفيز رغبتهم في استكشاف أسرار الذكاء الاصطناعي، ونفتح آفاقاً جديدة أمام أبنائنا، ولنكن جزءا من تشكيل مستقبلهم المشرق في عالم يحوي الإبداع والتحول."),
              ),
              Directionality(
                textDirection: TextDirection.rtl,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("1",style: getBoldStyle(color: Colors.black),),
                      Text("1/21",style: getMediumStyle(color: Colors.black,fontSize: 20,)),
                      Text("التالي",style: getMediumStyle(color: Colors.black,fontSize: 20,)),
                    ],
                  ),
                ),
              )
            ],
          ),
          const CustomAppBar()
        ],
      ),
    );
  }
}
