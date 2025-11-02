import 'package:flutter/foundation.dart';
import '../models/question_model.dart';
import '../data/quiz_data.dart';

class QuizState extends ChangeNotifier {
  String _userName = '';
  int _score = 0;
  int _currentQuestionIndex = 0;
  final List<Question> _questions = dummyQuestions;
  final Map<int, String> _userAnswers = {}; // {index_pertanyaan: jawaban_dipilih}

  String get userName => _userName;
  int get score => _score;
  int get currentQuestionIndex => _currentQuestionIndex;
  List<Question> get questions => _questions;
  int get totalQuestions => _questions.length;
  Question get currentQuestion => _questions[_currentQuestionIndex];
  Map<int, String> get userAnswers => _userAnswers;

  // Menghitung persentase skor
  double get scorePercentage => totalQuestions > 0 ? (_score / totalQuestions) : 0.0;

  void startQuiz(String name) {
    _userName = name;
    _score = 0;
    _currentQuestionIndex = 0;
    _userAnswers.clear();
    notifyListeners();
  }

  // Logika menjawab pertanyaan
  void answerQuestion(String selectedOption) {
    if (_userAnswers.containsKey(_currentQuestionIndex)) return; // Mencegah jawaban ganda

    _userAnswers[_currentQuestionIndex] = selectedOption;

    if (selectedOption == currentQuestion.correctAnswer) {
      _score++;
    }

    notifyListeners(); // Update UI segera setelah jawaban dipilih
  }

  // Navigasi ke pertanyaan berikutnya
  void nextQuestion() {
    if (_currentQuestionIndex < totalQuestions - 1) {
      _currentQuestionIndex++;
      notifyListeners();
    }
  }

  void resetQuiz() {
    _userName = '';
    _score = 0;
    _currentQuestionIndex = 0;
    _userAnswers.clear();
    notifyListeners();
  }
}