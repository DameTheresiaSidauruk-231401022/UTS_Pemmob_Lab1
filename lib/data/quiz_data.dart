import '../models/question_model.dart';

final List<Question> dummyQuestions = [
  Question(
    questionText: 'Siapakah pendiri Flutter?',
    options: ['Google', 'Facebook', 'Microsoft', 'Apple'],
    correctAnswer: 'Google',
    explanation: 'Flutter dikembangkan oleh Google dan pertama kali dirilis pada tahun 2017. Ini adalah SDK UI open-source.',
  ),
  Question(
    questionText: 'Apa bahasa pemrograman utama yang digunakan oleh Flutter?',
    options: ['Java', 'Kotlin', 'Dart', 'Swift'],
    correctAnswer: 'Dart',
    explanation: 'Dart adalah bahasa pemrograman yang dioptimalkan klien yang dikembangkan oleh Google, digunakan untuk membangun aplikasi seluler, web, dan desktop dengan Flutter.',
  ),
  Question(
    questionText: 'Widget apa yang digunakan untuk tata letak dalam Flutter?',
    options: ['Container', 'Text', 'Scaffold', 'Semua di atas'],
    correctAnswer: 'Semua di atas',
    explanation: 'Container dan Scaffold adalah widget tata letak, sedangkan Text adalah widget konten, tetapi semua digunakan untuk menyusun UI. Jawaban yang paling tepat dalam konteks ini adalah "Semua di atas".',
  ),
  Question(
    questionText: 'Tahun berapa Flutter dirilis stabil pertamanya?',
    options: ['2015', '2017', '2018', '2020'],
    correctAnswer: '2018',
    explanation: 'Flutter 1.0 (versi stabil pertama) diumumkan pada konferensi Flutter Live pada Desember 2018, setelah beberapa tahun dalam pengembangan beta.',
  ),
];
