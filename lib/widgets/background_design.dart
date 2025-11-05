import 'package:flutter/material.dart';

class BackgroundDesign extends StatelessWidget {
  const BackgroundDesign({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final primaryColor = theme.colorScheme.primary;
    final isDarkMode = theme.brightness == Brightness.dark;

    return Stack(
      children: [

        Positioned(
          top: -200,
          left: -200,
          child: Container(
            width: 400,
            height: 400,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: primaryColor.withOpacity(isDarkMode ? 0.1 : 0.05),
            ),
          ),
        ),

        Positioned(
          bottom: -150,
          right: -100,
          child: Transform.rotate(
            angle: 0.5,
            child: Container(
              width: 350,
              height: 400,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: primaryColor.withOpacity(isDarkMode ? 0.08 : 0.03),
              ),
            ),
          ),
        ),
      ],
    );
  }
}