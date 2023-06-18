import 'package:braincarrier/src/ui/screens/teacher/add_question_screen.dart';
import 'package:braincarrier/src/ui/util/app_colors.dart';
import 'package:braincarrier/src/ui/widgets/teacher_quiz_Items_widget.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class TeacherQuizScreen extends StatefulWidget {
  const TeacherQuizScreen({super.key});

  @override
  State<TeacherQuizScreen> createState() => _TeacherQuizScreenState();
}

class _TeacherQuizScreenState extends State<TeacherQuizScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Quizzes',
          style: TextStyle(wordSpacing: 2),
        ),
      ),
      body: Column(
        children: [
          Expanded(
              child: ListView.builder(
                  itemCount: 10,
                  itemBuilder: (BuildContext context, index) {
                    return TeacherQuizItemsWidget(index: index + 1);
                  }))
        ],
      ),
      floatingActionButton: FloatingActionButton(
        elevation: 5,
        backgroundColor: primaryColor,
        onPressed: () {
          Get.to(const AddQuestionScreen());
        },
        child: const Icon(
          Icons.add,
          size: 20,
          color: Colors.white,
        ),
      ),
    );
  }
}
