import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'providers/quiz_state.dart';
import 'providers/theme_provider.dart';
import 'screens/welcome_screen.dart'; // Sudah diimpor
import 'screens/quiz_screen.dart';
import 'screens/result_screen.dart';
import 'screens/review_screen.dart';
import 'screens/splash_screen.dart';
import 'utils/app_themes.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => QuizState()),
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

// StatelessWidget
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

    final themeProvider = Provider.of<ThemeProvider>(context);

    return MaterialApp(
      title: 'Aplikasi Kuis Estetik',
      debugShowCheckedModeBanner: false,
      // Menggunakan tema dari AppThemes
      theme: AppThemes.lightTheme,
      darkTheme: AppThemes.darkTheme,
      themeMode: themeProvider.themeMode,

      initialRoute: SplashScreen.routeName,
      routes: {
        SplashScreen.routeName: (context) => const SplashScreen(),

        WelcomeScreen.routeName: (context) => WelcomeScreen(),
        QuizScreen.routeName: (context) => const QuizScreen(),
        ResultScreen.routeName: (context) => const ResultScreen(),
        ReviewScreen.routeName: (context) => const ReviewScreen(),
      },
    );
  }
}