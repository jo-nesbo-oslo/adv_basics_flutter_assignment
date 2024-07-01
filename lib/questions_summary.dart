import 'dart:math';

import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';

class QuestionsSummary extends StatelessWidget {
  const QuestionsSummary(this.summaryData, {super.key});

  final List<Map<String, Object>> summaryData;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: SingleChildScrollView(
        child: Column(
          children: summaryData.map(
            (data) {
              return Row(
                children: [
                  Text(
                    ((data['question_index'] as int) + 1).toString(),
                    style: GoogleFonts.lato(
                        color: const Color.fromARGB(255, 103, 3, 142),
                        fontSize: 20,
                        backgroundColor: Colors.white),
                    textAlign: TextAlign.center,
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        Text(data['question'] as String,
                            style: GoogleFonts.lato(
                              color: const Color.fromARGB(255, 255, 255, 255),
                              fontSize: 18,
                            )),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          data['user_answer'] as String,
                          style: GoogleFonts.lato(
                            color: Color.fromARGB(255, 39, 180, 245),
                            fontSize: 16,
                          ),
                          textAlign: TextAlign.left,
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          data['correct_answer'] as String,
                          style: GoogleFonts.lato(
                            color: const Color.fromARGB(255, 103, 3, 142),
                            fontSize: 16,
                          ),
                          textAlign: TextAlign.left,
                        ),
                      ],
                    ),
                  ),
                ],
              );
            },
          ).toList(),
        ),
      ),
    );
  }
}
