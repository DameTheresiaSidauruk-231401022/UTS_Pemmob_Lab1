import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/quiz_state.dart';
import '../widgets/review_card.dart';

class ReviewScreen extends StatelessWidget {
  static const routeName = '/review';

  const ReviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Menggunakan Consumer untuk mendapatkan data kuis
    return Consumer<QuizState>(
      builder: (context, quizState, child) {

        final screenWidth = MediaQuery.of(context).size.width;

        return Scaffold(
          appBar: AppBar(
            title: const Text('Review Jawaban'),
          ),
          body: ListView.builder(
            padding: EdgeInsets.all(screenWidth * 0.04),
            itemCount: quizState.totalQuestions,
            itemBuilder: (context, index) {
              final question = quizState.questions[index];
              final userAnswer = quizState.userAnswers[index];
              final isCorrect = userAnswer == question.correctAnswer;

              return ReviewCard(
                questionNumber: index + 1,
                questionText: question.questionText,
                userAnswer: userAnswer ?? 'Tidak dijawab',
                correctAnswer: question.correctAnswer,
                isCorrect: isCorrect,

                explanation: question.explanation,
                screenWidth: screenWidth,
              );
            },
          ),
        );
      },
    );
  }
}
