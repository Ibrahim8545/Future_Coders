import 'package:courseapp/features/main/fathers/presentaion/widgets/expandable_tile.dart';
import 'package:flutter/material.dart';

class HowToWorkTab extends StatelessWidget {
  const HowToWorkTab({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Column(
        children: [
          ExpandableTile(title: 'انشاء حساب',description: 'أنشئ حسابًا لطفلك في مبرمجين المستقبل،واختر الدورة التعليمية التي يرغبون في البدء بها.',),
          ExpandableTile(
            title: 'كل أسبوع، سيتلقى طفلك...',
            description:
            'كل أسبوع، سيتلقى طفلك مواد تعليمية مصنعة تستند إلى المشاريع، بما في ذلك الفيديوهات التعليمية، والتمارين والاختبارات، مصممة لاستكشافها بالسرعة التي يريدها.',
          ),
          ExpandableTile(title: 'التواصل مع المرشد',),
          ExpandableTile(title: 'العمل على المشاريع'),
          ExpandableTile(title: 'التقدم والنمو'),
        ],
      ),
    );
  }
}


