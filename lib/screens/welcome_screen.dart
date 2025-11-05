import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/quiz_state.dart';
import '../providers/theme_provider.dart';
import '../widgets/custom_button.dart';
import '../widgets/background_design.dart'; // Import BackgroundDesign
import 'quiz_screen.dart';

// StatelessWidget
class WelcomeScreen extends StatelessWidget {
  static const routeName = '/welcome';
  final TextEditingController _nameController = TextEditingController();

  WelcomeScreen({super.key});

  void _showErrorSnackbar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Theme.of(context).colorScheme.error,
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final theme = Theme.of(context);
    final isLargeScreen = size.width > 600;

    return Scaffold(
      body: Stack(
        children: [

          const BackgroundDesign(),

          Center(
            child: ConstrainedBox(
              constraints: BoxConstraints(maxWidth: isLargeScreen ? 500 : size.width),
              child: SingleChildScrollView(
                padding: EdgeInsets.all(size.width * 0.08),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Align(
                      alignment: Alignment.topRight,
                      child: IconButton(
                        icon: Icon(
                          Provider.of<ThemeProvider>(context).themeMode == ThemeMode.dark
                              ? Icons.light_mode_rounded
                              : Icons.dark_mode_rounded,
                        ),
                        onPressed: () {
                          final isDark = theme.brightness == Brightness.dark;
                          Provider.of<ThemeProvider>(context, listen: false)
                              .toggleTheme(!isDark);
                        },
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(16.0),
                      decoration: BoxDecoration(
                        color: theme.colorScheme.surface,
                        borderRadius: BorderRadius.circular(20.0),

                        boxShadow: [
                          BoxShadow(
                            color: theme.colorScheme.primary.withOpacity(theme.brightness == Brightness.dark ? 0.2 : 0.1),
                            spreadRadius: 2,
                            blurRadius: 15,
                            offset: const Offset(0, 8),
                          ),
                        ],
                      ),
                      child: Image.asset(
                        'assets/images/quiz_logo.png',
                        height: size.height * (isLargeScreen ? 0.15 : 0.20),
                        errorBuilder: (context, error, stackTrace) {
                          return Icon(Icons.quiz, size: size.height * 0.15, color: theme.colorScheme.secondary);
                        },
                      ),
                    ),
                    SizedBox(height: size.height * 0.05),
                    Text(
                      'Siap Menguji Pengetahuanmu?',
                      style: theme.textTheme.headlineLarge?.copyWith(
                        fontWeight: FontWeight.w800,
                        fontSize: size.width * (isLargeScreen ? 0.05 : 0.08),
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: size.height * 0.03),

                    TextField(
                      controller: _nameController,
                      style: theme.textTheme.bodyLarge,
                      decoration: InputDecoration(
                        labelText: 'Masukkan Nama Anda',
                        labelStyle: theme.textTheme.bodyMedium?.copyWith(color: theme.colorScheme.primary),
                        filled: true,
                        fillColor: theme.colorScheme.surface.withOpacity(0.9),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide.none,
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide(color: theme.colorScheme.primary, width: 2),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide(color: theme.colorScheme.primary.withOpacity(0.3), width: 1),
                        ),
                      ),
                    ),
                    SizedBox(height: size.height * 0.04),

                    CustomButton(
                      text: 'Mulai Kuis Sekarang',
                      onPressed: () {
                        final name = _nameController.text.trim();
                        if (name.isNotEmpty) {
                          Provider.of<QuizState>(context, listen: false).startQuiz(name);

                          Navigator.of(context).pushNamed(QuizScreen.routeName);
                        } else {
                          _showErrorSnackbar(context, 'Nama tidak boleh kosong!');
                        }
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}