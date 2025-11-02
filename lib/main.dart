import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'providers/quiz_state.dart';
import 'providers/theme_provider.dart';
import 'screens/welcome_screen.dart';
import 'screens/quiz_screen.dart';
import 'screens/result_screen.dart';
import 'screens/review_screen.dart';
import 'utils/app_themes.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => QuizState()),
        ChangeNotifierProvider(create: (_) => ThemeProvider()), // Bonus: 1
      ],
      child: const MyApp(),
    ),
  );
}

// StatelessWidget (Wajib: 1)
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Wajib: 5 & Bonus: 1
    final themeProvider = Provider.of<ThemeProvider>(context);

    return MaterialApp(
      title: 'Aplikasi Kuis Estetik',
      debugShowCheckedModeBanner: false,
      theme: AppThemes.lightTheme,
      darkTheme: AppThemes.darkTheme,
      themeMode: themeProvider.themeMode,

      initialRoute: WelcomeScreen.routeName,
      routes: {
        WelcomeScreen.routeName: (context) => WelcomeScreen(),
        QuizScreen.routeName: (context) => const QuizScreen(),
        ResultScreen.routeName: (context) => const ResultScreen(),
        ReviewScreen.routeName: (context) => const ReviewScreen(), // Rute untuk Review Jawaban
      },
    );
  }
}
