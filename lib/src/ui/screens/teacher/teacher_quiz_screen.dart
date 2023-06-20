
import 'package:braincarrier/src/ui/screens/teacher/add_quiz_screen.dart';
import 'package:braincarrier/src/ui/state_managers/teacher_quiz_controller.dart';
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
  void initState() {
    // TODO: implement initState
    super.initState();
     TeacherQuizController.instance.getAllQuizByUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Quizzes',
          style: TextStyle(wordSpacing: 2),
        ),
      ),
      body: GetBuilder<TeacherQuizController>(

        builder: (controller) {
          return Column(
            children: [
              Expanded(
                  child: ListView.builder(
                      itemCount:controller.allquiz.length,
                      itemBuilder: (BuildContext context, index) {
                        return TeacherQuizItemsWidget(index: index+1 ,quiz:TeacherQuizController.instance.allquiz[index]);
                      }))
            ],
          );
        }
      ),
      floatingActionButton: FloatingActionButton(
        elevation: 5,
        backgroundColor: primaryColor,
        onPressed: () {
          Get.to(const AddQuizScreen());
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
