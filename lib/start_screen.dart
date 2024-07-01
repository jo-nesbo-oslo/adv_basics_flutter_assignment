import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';

final ButtonStyle style =
    ElevatedButton.styleFrom(textStyle: const TextStyle(fontSize: 20));

class StartScreen extends StatelessWidget {
  const StartScreen(this.startQuiz, {super.key});

  final void Function() startQuiz;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            'assets/images/quiz-logo.png',
            width: 300,
            color: const Color.fromARGB(50, 255, 255, 255),
          ),
          // Opacity(
          //   opacity: 0.5,
          //   child: Image.asset(
          //     'assets/images/quiz-logo.png',
          //     width: 300,
          //   ),
          // ),
          const SizedBox(
            height: 80,
          ),
          Text(
            'Learn Flutter the fun way!',
            style: GoogleFonts.lato(
              color: const Color.fromARGB(255, 103, 3, 142),
              fontSize: 24,
            ),
          ),
          /*TextStyle(
                fontSize: 24, color: Color.fromARGB(255, 103, 3, 142)),*/

          const SizedBox(
            height: 30,
          ),
          OutlinedButton.icon(
              icon: const Icon(Icons.arrow_right_alt),
              style: OutlinedButton.styleFrom(foregroundColor: Colors.white),
              onPressed: startQuiz,
              label: const Text('Start Quiz', style: TextStyle(fontSize: 20))),
        ],
      ),
    );
  }
}
