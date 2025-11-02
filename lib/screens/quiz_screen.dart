import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/quiz_state.dart';
import '../widgets/option_card.dart';
import '../widgets/custom_button.dart';
import 'result_screen.dart';

// StatelessWidget (state kuis dikelola oleh Provider) (Wajib: 1)
class QuizScreen extends StatelessWidget {
  static const routeName = '/quiz';

  const QuizScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size; // Wajib: 6
    final isLandscape = size.width > size.height; // Bonus: 2 (Rotasi)

    // Wajib: 7 - Consumer
    return Consumer<QuizState>(
      builder: (context, quizState, child) {
        if (quizState.questions.isEmpty) {
          return const Scaffold(body: Center(child: Text('Data kuis kosong.')));
        }

        final currentQuestion = quizState.currentQuestion;
        final isAnswered = quizState.userAnswers.containsKey(quizState.currentQuestionIndex);
        final isLastQuestion = quizState.currentQuestionIndex == quizState.totalQuestions - 1;

        Widget buildQuestionContent(bool largeScreen) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              // Progres
              Text(
                'Pertanyaan ${quizState.currentQuestionIndex + 1}/${quizState.totalQuestions}',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(color: Theme.of(context).colorScheme.primary),
              ),
              const Divider(height: 20),
              // Pertanyaan
              Text(
                currentQuestion.questionText,
                style: Theme.of(context).textTheme.headlineLarge,
              ),
              SizedBox(height: largeScreen ? 30 : 20),
              // Opsi Jawaban
              ...currentQuestion.options.map((option) {
                final isSelected = quizState.userAnswers[quizState.currentQuestionIndex] == option;
                final isCorrect = option == currentQuestion.correctAnswer;

                return OptionCard(
                  optionText: option,
                  onTap: () => quizState.answerQuestion(option),
                  isSelected: isSelected,
                  isCorrect: isCorrect,
                  isAnswered: isAnswered,
                );
              }).toList(),
            ],
          );
        }

        Widget buildNextButton() {
          // Wajib: 3 - Custom Button
          return CustomButton(
            text: isLastQuestion ? 'Lihat Hasil' : 'Lanjut',
            isEnabled: isAnswered,
            onPressed: () {
              if (!isAnswered) return;

              if (isLastQuestion) {
                // Wajib: 2 - Navigasi ke hasil
                Navigator.of(context).pushReplacementNamed(ResultScreen.routeName);
              } else {
                quizState.nextQuestion();
              }
            },
          );
        }

        return Scaffold(
          appBar: AppBar(
            title: Text('Quiz Time!'),
            automaticallyImplyLeading: false,
          ),
          body: Padding(
            padding: EdgeInsets.all(size.width * 0.05),
            child: isLandscape || size.width > 600 // Bonus: 2 (Responsive Layout)
                ? Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 3,
                  child: SingleChildScrollView(child: buildQuestionContent(true)),
                ),
                const VerticalDivider(width: 40),
                Expanded(
                  flex: 1,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [buildNextButton()],
                  ),
                ),
              ],
            )
                : Column( // Layout Portrait
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Expanded(child: SingleChildScrollView(child: buildQuestionContent(false))),
                buildNextButton(),
              ],
            ),
          ),
        );
      },
    );
  }
}