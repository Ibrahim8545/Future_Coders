import 'package:courseapp/features/main/fathers/presentaion/widgets/expandable_tile.dart';
import 'package:flutter/material.dart';

class PopularQuestionsTab extends StatelessWidget {
  const PopularQuestionsTab({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Column(
        children: [
          ExpandableTile(title: 'كيف يعمل ذلك؟',description: 'يتمحور جوهر البرنامج حول التعلم القائم على المشروع. في كل شهر، سيتلقى الطفل مشروعًا ومواد تعليمية تحتاجها لفهم وإكمال المشروع. يتم تقسيم هذه المواد إلى مراحل أسبوعية تمنح الطفل وقتًا كافيًا لإنهاء المشروع. نحن نقدم أيضًا جلسات توجيه فردية أسبوعية. في هذه الجلسات، سيراجع طفلك المشروع وتقدمه مع مرشد مؤهل سيساعده ويقدم له ملاحظات. هناك أيضًا جلسات جماعية أسبوعية حيث سيرفع الطفل حلوله الفريدة للمشروع إلى المدرب وزملائه في بيئة إيجابية وداعمة، مما سيطور مهارات الاتصال لدى الطفل.',),
          ExpandableTile(
            title: 'ماذا يتضمن البرنامج؟',
            description:
            'كل أسبوع، سيتلقى طفلك مواد تعليمية مصنعة تستند إلى المشاريع، بما في ذلك الفيديوهات التعليمية، والتمارين والاختبارات، مصممة لاستكشافها بالسرعة التي يريدها.',
          ),
          ExpandableTile(title: 'ماذا يعود تعلم البرمجة بالفائدة على طفلي؟',),
          ExpandableTile(title: 'لأي فئة عمرية تناسب البرمجة بشكل أفضل؟'),
          ExpandableTile(title: 'يبدو أن البرمجة معقدة إلى حد ما هل سيجد طفلي المتعة فيها'),
          ExpandableTile(title: 'كم من الوقت سيستغرق لإنهاء الدورة التعليمية؟'),
        ],
      ),
    );
  }
}
