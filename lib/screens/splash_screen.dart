import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../widgets/background_design.dart'; // Import background desain
import 'welcome_screen.dart';
import 'dart:math' as math;

// Menggunakan StatefulWidget untuk animasi
class SplashScreen extends StatefulWidget {
  static const routeName = '/'; // Route untuk inisialisasi aplikasi

  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _opacityAnimation;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(milliseconds: 1500),
      vsync: this,
    );

    _opacityAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeIn),
    );

    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, 0.2),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOutCubic,
    ));

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    final theme = Theme.of(context);
    final size = MediaQuery.of(context).size;
    final isDarkMode = theme.brightness == Brightness.dark;

    final Color primaryAppColor = theme.colorScheme.primary;
    final Color secondaryAccentColor = theme.colorScheme.secondary;
    final Color textColor = theme.textTheme.headlineLarge?.color ?? Colors.black;

    return Scaffold(

      body: Stack(
        children: [

          const BackgroundDesign(),

          Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 500),
              child: SafeArea(
                child: FadeTransition(
                  opacity: _opacityAnimation,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: size.width * 0.1),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        SlideTransition(
                          position: _slideAnimation,
                          child: Column(
                            children: [
                              Container(
                                padding: const EdgeInsets.all(24.0),
                                decoration: BoxDecoration(
                                  color: theme.colorScheme.surface,
                                  borderRadius: BorderRadius.circular(20.0),
                                  boxShadow: [
                                    BoxShadow(
                                      color: primaryAppColor.withOpacity(isDarkMode ? 0.2 : 0.1),
                                      spreadRadius: 2,
                                      blurRadius: 15,
                                      offset: const Offset(0, 8),
                                    ),
                                  ],
                                ),
                                child: Image.asset(
                                  'assets/images/quiz_logo.png',
                                  height: size.height * 0.25,
                                  errorBuilder: (context, error, stackTrace) {

                                    return CircleAvatar(
                                      radius: size.height * 0.125,
                                      backgroundColor: primaryAppColor.withOpacity(0.1),
                                      child: Icon(Icons.question_mark_rounded,
                                          size: size.height * 0.15,
                                          color: secondaryAccentColor),
                                    );
                                  },
                                ),
                              ),

                              SizedBox(height: size.height * 0.08),

                              Text(
                                'KUIS AKADEMIK',
                                textAlign: TextAlign.center,
                                style: theme.textTheme.displaySmall?.copyWith(
                                  color: textColor,
                                  fontWeight: FontWeight.w900,
                                  letterSpacing: 2.5,
                                ),
                              ),

                              SizedBox(height: size.height * 0.015),

                              Text(
                                'Uji Pengetahuanmu, Taklukkan Tantangannya!',
                                textAlign: TextAlign.center,
                                style: theme.textTheme.titleMedium?.copyWith(
                                  color: theme.textTheme.bodyMedium?.color?.withOpacity(0.7),
                                ),
                              ),
                            ],
                          ),
                        ),

                        SizedBox(height: size.height * 0.15),

                        SlideTransition(
                          position: _slideAnimation,
                          child: Container(
                            width: double.infinity,
                            constraints: const BoxConstraints(maxWidth: 300),
                            child: ElevatedButton.icon(
                              icon: const Icon(Icons.arrow_forward_rounded, size: 24),
                              label: const Text('Mulai Kuis Sekarang'),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: primaryAppColor,
                                foregroundColor: Colors.white,
                                padding: const EdgeInsets.symmetric(vertical: 14),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                elevation: 8,
                                textStyle: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
                              ),
                              onPressed: () {

                                Navigator.of(context).pushReplacementNamed(WelcomeScreen.routeName);
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}