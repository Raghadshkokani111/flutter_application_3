import 'package:flutter/material.dart';
import 'package:flutter_application_3/letters/arabicLetter/arabicLibrary/library_screen.dart';
import 'package:flutter_application_3/math/math_quizes/level1_quiz.dart';
import 'package:easy_localization/easy_localization.dart';
import 'practice_levels_screen.dart';
import '../letters/arabicLetter/arabicLevel2/quiz_all_screen.dart';

class SubjectLevelsScreen extends StatelessWidget {
  final String subject;

  const SubjectLevelsScreen({super.key, required this.subject});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          subject,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 32,
            fontWeight: FontWeight.bold,
            fontFamily: 'Arial',
          ),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(height: 50),
          Image.asset("images/subject_fox.jpg", height: 300),
          const SizedBox(height: 50),
          _buildLevelButton(context, tr('practice')),
          _buildLevelButton(context, tr('quiz')),
          _buildLevelButton(context, tr('library')),
          const Spacer(),
        ],
      ),
    );
  }

  Widget _buildLevelButton(BuildContext context, String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 50.0),
      child: GestureDetector(
        onTap: () {
          if (text == tr('practice')) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => PracticeLevelsScreen(subject: subject),
              ),
            );
          } else if (text == tr('quiz')) {
            if (subject == tr('arabic')) {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => QuizAScreen()),
              );
            } else if (subject == tr('math')) {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Level1Quiz()),
              );
            }
          } else if (text == tr('library')) {
            if (subject == tr('arabic')) {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ArabicLibraryScreen()),
              );
            } else if (subject == tr('math')) {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Level1Quiz()),
              );
            }
          }
        },
        child: Container(
          height: 85,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(18),
            color: const Color(0xFFFED2B5),
          ),
          child: Center(
            child: Text(
              text,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                fontFamily: 'Arial',
              ),
            ),
          ),
        ),
      ),
    );
  }
}
