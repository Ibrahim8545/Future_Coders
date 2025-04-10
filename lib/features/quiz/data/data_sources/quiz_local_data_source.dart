// lib/data/datasources/quiz_local_data_source.dart

import 'package:shared_preferences/shared_preferences.dart';

import '../models/quiz_model.dart';

abstract class QuizLocalDataSource {
  List<QuizLevelModel> getLevels();
  Future<void> saveProgress(int levelIndex, int questionIndex);
  Future<Map<String, int>> getProgress();
}

class QuizLocalDataSourceImpl implements QuizLocalDataSource {
  @override
  List<QuizLevelModel> getLevels() {
    // تم تحديث البيانات ليكون لدينا 3 مستويات، كل مستوى به 5 أسئلة
    return [
      const QuizLevelModel(
        levelTitle: "المستوى الأول",
        questions: [
          const QuizQuestionModel(
            question: "ما هو استخدام الكمبيوتر؟",
            options: [
              "طهي الطعام",
              "تشغيل الألعاب، الكتابة، حل المشكلات",
              "النوم"
            ],
            correctAnswerIndex: 1,
          ),
          const QuizQuestionModel(
            question: "ما هي وحدة المعالجة المركزية؟",
            options: ["جهاز إدخال", "عقل الكمبيوتر", "جهاز تخزين"],
            correctAnswerIndex: 1,
          ),
          const QuizQuestionModel(
            question: "ما هو نظام التشغيل؟",
            options: [
              "برنامج يشغل الأجهزة ويدير الموارد",
              "جهاز مادي في الكمبيوتر",
              "لغة برمجة"
            ],
            correctAnswerIndex: 0,
          ),
          const QuizQuestionModel(
            question: "ما هي الذاكرة العشوائية (RAM)؟",
            options: [
              "ذاكرة دائمة",
              "ذاكرة مؤقتة تُستخدم أثناء تشغيل الكمبيوتر",
              "قرص صلب"
            ],
            correctAnswerIndex: 1,
          ),
          const QuizQuestionModel(
            question: "ما هو الإنترنت؟",
            options: [
              "جهاز يشبه الكمبيوتر",
              "شبكة عالمية من أجهزة الكمبيوتر المتصلة",
              "برنامج تشغيل"
            ],
            correctAnswerIndex: 1,
          ),
        ],
      ),
      const QuizLevelModel(
        levelTitle: "المستوى الثاني",
        questions: [
          const QuizQuestionModel(
            question: "أي مما يلي هو لغة برمجة؟",
            options: ["بايثون", "الهاتف", "جوجل"],
            correctAnswerIndex: 0,
          ),
          const QuizQuestionModel(
            question: "ما هو HTML؟",
            options: [
              "لغة برمجة",
              "لغة ترميز لإنشاء صفحات الويب",
              "نظام تشغيل"
            ],
            correctAnswerIndex: 1,
          ),
          const QuizQuestionModel(
            question: "أي من التالي يستخدم لتصميم مظهر موقع الويب؟",
            options: ["Java", "CSS", "Python"],
            correctAnswerIndex: 1,
          ),
          const QuizQuestionModel(
            question: "ما هو JavaScript؟",
            options: [
              "لغة برمجة تستخدم لجعل مواقع الويب تفاعلية",
              "نوع من القهوة",
              "برنامج تحرير النصوص"
            ],
            correctAnswerIndex: 0,
          ),
          const QuizQuestionModel(
            question: "ما هو SQL؟",
            options: [
              "لغة البرمجة للألعاب",
              "لغة الاستعلام الهيكلية للتعامل مع قواعد البيانات",
              "نوع من أنواع الكمبيوتر"
            ],
            correctAnswerIndex: 1,
          ),
        ],
      ),
      const QuizLevelModel(
        levelTitle: "المستوى الثالث",
        questions: [
          const QuizQuestionModel(
            question: "ماذا يفعل ال loop في البرمجة؟",
            options: [
              "يجعل الكمبيوتر يعيد تنفيذ الأوامر أكثر من مرة",
              "يستخدم لإضافة صور إلى البرامج",
              "يوقف البرنامج عن العمل"
            ],
            correctAnswerIndex: 0,
          ),
          const QuizQuestionModel(
            question: "ما هي الدالة (function) في البرمجة؟",
            options: [
              "نوع من البيانات",
              "مجموعة من الأوامر البرمجية التي تؤدي مهمة محددة",
              "خطأ في البرنامج"
            ],
            correctAnswerIndex: 1,
          ),
          const QuizQuestionModel(
            question: "ما هو المتغير (variable) في البرمجة؟",
            options: [
              "اسم يُستخدم لتخزين البيانات",
              "خطأ في البرنامج",
              "نوع من الخوارزميات"
            ],
            correctAnswerIndex: 0,
          ),
          const QuizQuestionModel(
            question: "ما هي المصفوفة (array) في البرمجة؟",
            options: [
              "نوع من الدوال",
              "قائمة أو مجموعة من العناصر المخزنة في متغير واحد",
              "نظام تشغيل"
            ],
            correctAnswerIndex: 1,
          ),
          const QuizQuestionModel(
            question: "ما هو الشرط (if statement) في البرمجة؟",
            options: [
              "نوع من اللغات البرمجية",
              "خطأ في البرنامج",
              "عبارة تسمح بتنفيذ الكود إذا تحقق شرط معين"
            ],
            correctAnswerIndex: 2,
          ),
        ],
      ),
    ];
  }

  @override
  Future<void> saveProgress(int levelIndex, int questionIndex) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt('currentLevelIndex', levelIndex);
    await prefs.setInt('currentQuestionIndex', questionIndex);
  }

  @override
  Future<Map<String, int>> getProgress() async {
    final prefs = await SharedPreferences.getInstance();
    return {
      'levelIndex': prefs.getInt('currentLevelIndex') ?? 0,
      'questionIndex': prefs.getInt('currentQuestionIndex') ?? 0,
    };
  }
}
