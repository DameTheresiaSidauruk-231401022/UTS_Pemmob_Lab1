import 'package:flutter/material.dart';

class OptionCard extends StatelessWidget {
  final String optionText;
  final VoidCallback onTap;
  final bool isSelected;
  final bool isCorrect;
  final bool isAnswered;

  const OptionCard({
    required this.optionText,
    required this.onTap,
    this.isSelected = false,
    this.isCorrect = false,
    this.isAnswered = false,
  });

  @override
  Widget build(BuildContext context) {
    Color getCardColor() {
      // Gunakan warna surface/background sebagai fallback jika cardTheme.color null
      final defaultCardColor = Theme.of(context).cardTheme.color ?? Theme.of(context).colorScheme.surface;

      if (!isAnswered) {
        return isSelected ? Theme.of(context).colorScheme.secondary.withOpacity(0.5) : defaultCardColor;
      }
      if (isSelected) {
        return isCorrect ? Colors.green : Colors.red;
      }
      if (isCorrect) {
        return Colors.green.withOpacity(0.7);
      }
      return defaultCardColor;
    }

    return GestureDetector(
      onTap: isAnswered ? null : onTap,
      child: Card(
        // Wajib: 6 - Padding dinamis berdasarkan cardTheme (elevation)
        elevation: isSelected ? 8 : 4,
        margin: const EdgeInsets.symmetric(vertical: 8.0),
        color: getCardColor(),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            optionText,
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
              color: isAnswered && (isSelected || isCorrect) ? Colors.white : Theme.of(context).textTheme.bodyMedium!.color,
            ),
          ),
        ),
      ),
    );
  }
}