import 'package:flutter/material.dart';

class ReviewCard extends StatelessWidget {
  final int questionNumber;
  final String questionText;
  final String userAnswer;
  final String correctAnswer;
  final bool isCorrect;
  final String explanation;
  final double screenWidth;

  const ReviewCard({
    required this.questionNumber,
    required this.questionText,
    required this.userAnswer,
    required this.correctAnswer,
    required this.isCorrect,
    required this.explanation,
    required this.screenWidth,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    // Penyesuaian warna dan ikon berdasarkan status jawaban
    final Color statusColor = isCorrect ? Colors.green.shade600 : Colors.red.shade600;
    final IconData statusIcon = isCorrect ? Icons.check_circle_outline : Icons.cancel_outlined;
    final Color primaryColor = Theme.of(context).colorScheme.primary;

    return Card(

      margin: EdgeInsets.only(bottom: screenWidth * 0.04),
      elevation: 8,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding: EdgeInsets.all(screenWidth * 0.04),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            Row(
              children: [
                Icon(statusIcon, color: statusColor, size: 24), // Ikon Status
                SizedBox(width: screenWidth * 0.02),
                Text(
                  'Pertanyaan $questionNumber',
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: primaryColor,
                  ),
                ),
                const Spacer(),
                Text(
                  isCorrect ? 'BENAR' : 'SALAH',
                  style: Theme.of(context).textTheme.titleSmall?.copyWith(
                    fontWeight: FontWeight.w900,
                    color: statusColor,
                  ),
                ),
              ],
            ),
            const Divider(height: 15),

            Text(
              questionText,
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: screenWidth * 0.04),

            Container(
              padding: const EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                color: isCorrect
                    ? Colors.green.withOpacity(0.1)
                    : Colors.red.withOpacity(0.15),
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: isCorrect ? Colors.green.shade500 : Colors.red.shade500, width: 1),
              ),
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Jawaban Anda:',
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(fontWeight: FontWeight.w600)),
                  SizedBox(height: 4),
                  Text(userAnswer,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: isCorrect ? Theme.of(context).colorScheme.onSurface : Colors.red.shade900,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: screenWidth * 0.02),

            if (!isCorrect)
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Jawaban Yang Benar:',
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(fontWeight: FontWeight.w600)),
                    Text(correctAnswer,
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: Colors.green.shade700,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),

            SizedBox(height: screenWidth * 0.03),

            _buildExplanationSection(context, explanation, screenWidth),
          ],
        ),
      ),
    );
  }

  Widget _buildExplanationSection(BuildContext context, String explanation, double screenWidth) {

    return Card(
      elevation: 0,
      color: Theme.of(context).colorScheme.secondary.withOpacity(0.1),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: ExpansionTile(
        tilePadding: EdgeInsets.symmetric(horizontal: screenWidth * 0.03),
        title: Text('Lihat Pembahasan',
          style: Theme.of(context).textTheme.titleSmall?.copyWith(
            fontWeight: FontWeight.bold,
            color: Theme.of(context).colorScheme.secondary,
          ),
        ),
        leading: Icon(Icons.lightbulb_outline, color: Theme.of(context).colorScheme.secondary),
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(left: screenWidth * 0.05, right: screenWidth * 0.05, bottom: screenWidth * 0.04),
            child: Text(
              explanation,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                fontStyle: FontStyle.italic,
                color: Theme.of(context).colorScheme.onSurface.withOpacity(0.8),
              ),
              textAlign: TextAlign.justify,
            ),
          ),
        ],
      ),
    );
  }
}
