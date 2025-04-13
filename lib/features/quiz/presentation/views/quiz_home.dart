import 'package:courseapp/config/routes/routes.dart';
import 'package:courseapp/core/utils/color_manager.dart';
import 'package:courseapp/core/utils/styles_manager.dart';
import 'package:courseapp/features/quiz/presentation/bloc/quiz_bloc.dart';
import 'package:courseapp/features/quiz/presentation/bloc/quiz_event.dart';
import 'package:courseapp/features/quiz/presentation/bloc/quiz_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:courseapp/core/injectable.dart' as di;
import 'package:flutter_screenutil/flutter_screenutil.dart';

class QuizPage extends StatelessWidget {
  const QuizPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'اختبار البرمجة',
          style: getBoldStyle(
            color: ColorManager.black500,
          ),
        ),
        centerTitle: true,
      ),
      body: BlocProvider(
        create: (context) => di.sl<QuizBloc>(),
        child: BlocConsumer<QuizBloc, QuizState>(
          listener: (context, state) {
            if (state is QuizLoaded) {
              // Check if quiz is complete
              if (state.currentLevelIndex == state.levels.length - 1 &&
                  state.currentQuestionIndex ==
                      state.levels[state.currentLevelIndex].questions.length -
                          1 &&
                  state.isAnswered) {
                // Navigate to home page after a delay
                Future.delayed(const Duration(seconds: 1), () {
                  Navigator.pushNamedAndRemoveUntil(context, Routes.mainRoute, (route) => false,);
                });
              }
            }
          },
          builder: (context, state) {
            if (state is QuizInitial) {
              // Load quiz on start
              context.read<QuizBloc>().add(LoadQuiz());
              return const Center(child: CircularProgressIndicator());
            } else if (state is QuizLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is QuizLoaded) {
              return _buildQuizContent(context, state);
            } else if (state is QuizError) {
              return Center(child: Text('Error: ${state.message}'));
            }
            return const Center(child: Text('Unknown state'));
          },
        ),
      ),
    );
  }

  Widget _buildQuizContent(BuildContext context, QuizLoaded state) {
    final currentLevel = state.levels[state.currentLevelIndex];
    final currentQuestion = currentLevel.questions[state.currentQuestionIndex];

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Level and question indicators
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'السؤال ${state.currentQuestionIndex + 1} من 5',
                  style: getMediumStyle(
                      color: ColorManager.black500, fontSize: 16.sp),
                ),
                Text(
                  currentLevel.levelTitle,
                  style: getMediumStyle(
                      color: ColorManager.black500, fontSize: 16.sp),
                ),
              ],
            ),

            // Progress indicators
            Directionality(
              textDirection: TextDirection.rtl,
              child: Container(
                margin: const EdgeInsets.symmetric(vertical: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    5,
                    (index) => Container(
                      width: MediaQuery.of(context).size.width / 7,
                      height: 16,
                      margin: const EdgeInsets.symmetric(horizontal: 2),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(9),
                        color: index <= state.currentQuestionIndex
                            ? ColorManager.primary700
                            : ColorManager.primary700,
                      ),
                    ),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 40),

            // Question
            Directionality(
              textDirection: TextDirection.rtl,
              child: Text(
                '${state.currentQuestionIndex + 1} - ${currentQuestion.question}',
                textAlign: TextAlign.start,
                style: getMediumStyle(
                  color: ColorManager.black500,
                  fontSize: 22,
                ),
              ),
            ),

            SizedBox(height: 30.h),

            // Options
            ...List.generate(
              currentQuestion.options.length,
              (index) => Padding(
                padding: const EdgeInsets.only(bottom: 16.0),
                child: InkWell(
                  onTap: state.isAnswered
                      ? null
                      : () => context
                          .read<QuizBloc>()
                          .add(AnswerQuestion(optionIndex: index)),
                  child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: state.isAnswered &&
                                state.selectedOptionIndex == index
                            ? (state.isCorrect ?? false
                                ? Colors.green
                                : Colors.red)
                            : Colors.grey.shade300,
                        width: state.isAnswered &&
                                state.selectedOptionIndex == index
                            ? 2.5
                            : 1.5,
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(currentQuestion.options[index],
                        textAlign: TextAlign.center,
                        style: getMediumStyle(
                          color: ColorManager.black500,
                        )),
                  ),
                ),
              ),
            ),

            const Spacer(),

            // Navigation buttons
            Row(
              children: [
                if (state.currentQuestionIndex > 0 ||
                    state.currentLevelIndex > 0)
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () =>
                          context.read<QuizBloc>().add(PreviousQuestion()),
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8)),
                        backgroundColor: ColorManager.white,
                        side: BorderSide(color: ColorManager.primary700),
                        padding: const EdgeInsets.symmetric(vertical: 12),
                      ),
                      child: Text(
                        'السابق',
                        style: getMediumStyle(color: ColorManager.black500),
                      ),
                    ),
                  ),
                if (state.currentQuestionIndex > 0 ||
                    state.currentLevelIndex > 0)
                  const SizedBox(width: 10),
                Expanded(
                  child: ElevatedButton(
                    onPressed: state.isAnswered
                        ? () => context.read<QuizBloc>().add(NextQuestion())
                        : null,
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8)),
                      backgroundColor: ColorManager.primary700,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 12),
                    ),
                    child: Text(
                      'التالي',
                      style: getMediumStyle(color: ColorManager.white),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
