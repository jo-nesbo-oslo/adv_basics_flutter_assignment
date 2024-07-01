import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';

import 'package:adv_basics/answer_button.dart';

import 'package:adv_basics/data/questions.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen({
    super.key,
    required this.onSelectAnswer,
  });

  final void Function(String answer) onSelectAnswer;

  @override
  State<QuestionsScreen> createState() => _QuestionsScreenState();
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  var currentQuestionIndex = 0;

  answerQuestion(String selectedAnswer) {
    widget.onSelectAnswer(selectedAnswer);
    setState(() {
      currentQuestionIndex++;
      if (currentQuestionIndex >= questions.length) {
        currentQuestionIndex = 0;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final currentQuestion = questions[currentQuestionIndex];

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              currentQuestion.text,
              style: GoogleFonts.lato(
                  color: const Color.fromARGB(255, 246, 156, 216),
                  fontSize: 24,
                  fontWeight:
                      FontWeight.bold), //const TextStyle(color: Colors.white),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 30,
            ),
            ...currentQuestion.getShuffeldAnswers().map((answer) {
              return AnswerButton(
                  answerText: answer,
                  onTap: () {
                    answerQuestion(answer);
                  });
            })
          ],
        ),
      ),
    );
  }
}
