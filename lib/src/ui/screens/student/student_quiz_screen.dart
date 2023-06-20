import 'package:braincarrier/src/ui/widgets/student_quiz_item_widget.dart';
import 'package:flutter/material.dart';

import '../../state_managers/teacher_quiz_controller.dart';
import 'package:get/get.dart';

class StudentQuizzesScreen extends StatefulWidget {
  const StudentQuizzesScreen({super.key});

  @override
  State<StudentQuizzesScreen> createState() => _StudentQuizzesScreenState();
}

class _StudentQuizzesScreenState extends State<StudentQuizzesScreen> {


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    TeacherQuizController.instance.getAllQuiz();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Quizzes'),
      ),
      body:GetBuilder<TeacherQuizController>(

        builder: (controller) {
          return Column(
            children: [
              Expanded(
                  child: ListView.builder(
                      itemCount: controller.allquiz.length,
                      itemBuilder: (BuildContext context, index) {
                        return StudentQuizzesItemsWidget(index: index + 1,quiz: TeacherQuizController.instance.allquiz[index],);
                      }))
            ],
          );
        }
      ),
    );
  }
}
