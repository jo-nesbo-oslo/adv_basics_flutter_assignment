import 'package:flutter/material.dart';

import 'package:adv_basics/start_screen.dart';
import 'package:adv_basics/questions_screen.dart';
import 'package:adv_basics/data/questions.dart';
import 'package:adv_basics/results_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  // Widget? activeScreen;
  List<String> selectedAnswers = [];
  var activeScreen = 'start-screen';
  /*@override
  void initState() {
    super.initState();
    activeScreen = StartScreen(switchScreen);
    switchScreen();
  }*/

  void switchScreen() {
    setState(() {
      //activeScreen = const QuestionsScreen();
      activeScreen = 'questions-screen';
    });
  }

  void chooseAnswer(String answer) {
    //setState(() {
    selectedAnswers.add(answer);

    if (selectedAnswers.length == questions.length) {
      setState(() {
        // selectedAnswers = [];
        activeScreen = 'results-screen';
      });
    }
    // });
  }

  void switchScreenToRestartQuiz() {
    setState(() {
      //activeScreen = const QuestionsScreen();
      selectedAnswers = [];
      activeScreen = activeScreen == 'results-screen' ? 'questions-screen' : '';
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget screenWidget = StartScreen(switchScreen);

    if (activeScreen == 'questions-screen') {
      screenWidget = QuestionsScreen(
        onSelectAnswer: chooseAnswer,
      );
    }

    if (activeScreen == 'results-screen') {
      screenWidget = ResultsScreen(
        chosenAnswers: selectedAnswers,
        restartQuiz: switchScreenToRestartQuiz,
      );
    }

    return MaterialApp(
      home: Scaffold(
          body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromARGB(255, 28, 3, 72),
              Color.fromARGB(79, 30, 163, 1)
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: screenWidget,
      )),
    );
  }
}
