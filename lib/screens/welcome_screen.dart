import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/quiz_state.dart';
import '../providers/theme_provider.dart';
import '../widgets/custom_button.dart';
import 'quiz_screen.dart';

// StatelessWidget (Wajib: 1)
class WelcomeScreen extends StatelessWidget {
  static const routeName = '/';
  final TextEditingController _nameController = TextEditingController();

  WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size; // Wajib: 6
    final isLargeScreen = size.width > 600; // Bonus: 2

    return Scaffold(
      body: Center(
        // Bonus: 2 - Batasi lebar di layar besar
        child: ConstrainedBox(
          constraints: BoxConstraints(maxWidth: isLargeScreen ? 500 : size.width),
          child: SingleChildScrollView(
            padding: EdgeInsets.all(size.width * 0.08),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                // Toggle Theme Button (Bonus: 1)
                Align(
                  alignment: Alignment.topRight,
                  child: IconButton(
                    icon: Icon(
                      Provider.of<ThemeProvider>(context).themeMode == ThemeMode.dark
                          ? Icons.light_mode
                          : Icons.dark_mode,
                    ),
                    onPressed: () {
                      final isDark = Theme.of(context).brightness == Brightness.dark;
                      Provider.of<ThemeProvider>(context, listen: false)
                          .toggleTheme(!isDark);
                    },
                  ),
                ),
                // Wajib: 4 - Gambar
                Image.asset(
                  'assets/images/quiz_logo.png',
                  height: size.height * (isLargeScreen ? 0.2 : 0.25), // Wajib: 6
                ),
                SizedBox(height: size.height * 0.05),
                Text(
                  'Siap Menguji Pengetahuanmu?',
                  style: Theme.of(context).textTheme.headlineLarge,
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: size.height * 0.03),
                TextField(
                  controller: _nameController,
                  decoration: InputDecoration(
                    labelText: 'Masukkan Nama Anda',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
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
                      // Wajib: 2 - Navigasi
                      Navigator.of(context).pushNamed(QuizScreen.routeName);
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Nama tidak boleh kosong!'))
                      );
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}