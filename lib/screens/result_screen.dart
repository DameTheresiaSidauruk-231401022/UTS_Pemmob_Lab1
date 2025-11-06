import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/quiz_state.dart';
import '../widgets/custom_button.dart';
import 'welcome_screen.dart';
import 'review_screen.dart';

// StatelessWidget
class ResultScreen extends StatelessWidget {
  static const routeName = '/result';

  const ResultScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final quizState = Provider.of<QuizState>(context);
    final size = MediaQuery.of(context).size; // Wajib: 6
    final scorePercentage = quizState.scorePercentage;

    // Tentukan pesan dan ikon berdasarkan skor
    final String message;
    final IconData icon;
    final Color color;

    if (scorePercentage >= 0.8) {
      message = 'Sangat Bagus!';
      icon = Icons.star;
      color = Colors.green;
    } else if (scorePercentage >= 0.5) {
      message = 'Kerja Bagus!';
      icon = Icons.check_circle;
      color = Colors.orange;
    } else {
      message = 'Perlu Belajar Lagi.';
      icon = Icons.close;
      color = Colors.red;
    }

    return Scaffold(
      appBar: AppBar(title: const Text('Hasil Kuis'), automaticallyImplyLeading: false),
      // Bungkus konten body dengan SingleChildScrollView
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: EdgeInsets.all(size.width * 0.08),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,

              children: <Widget>[
                SizedBox(height: size.height * 0.05),
                Icon(icon, size: 80, color: color),
                SizedBox(height: size.height * 0.03),
                Text(
                  message,
                  style: Theme.of(context).textTheme.headlineMedium!.copyWith(color: color),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: size.height * 0.01),
                Text(
                  '${quizState.userName}, skor Anda:',
                  style: Theme.of(context).textTheme.titleLarge,
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: size.height * 0.02),
                // Tampilan Skor
                Text(
                  '${quizState.score} / ${quizState.totalQuestions}',
                  style: Theme.of(context).textTheme.displayLarge!.copyWith(
                    color: color,
                  ),
                ),
                SizedBox(height: size.height * 0.05),
                // Custom Button
                CustomButton(
                  text: 'Ulangi Kuis',
                  onPressed: () {
                    quizState.resetQuiz();
                    // Navigasi ke halaman awal
                    Navigator.of(context).pushNamedAndRemoveUntil(WelcomeScreen.routeName, (Route<dynamic> route) => false);
                  },
                ),
                CustomButton(
                  text: 'Review Jawaban',
                  onPressed: () {
                    //  Navigasi ke halaman review
                    Navigator.of(context).pushNamed(ReviewScreen.routeName);
                  },
                ),
                SizedBox(height: size.height * 0.05),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
