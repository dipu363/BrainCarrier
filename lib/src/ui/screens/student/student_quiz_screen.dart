import 'package:braincarrier/src/ui/widgets/student_quiz_item_widget.dart';
import 'package:flutter/material.dart';

class StudentQuizzesScreen extends StatefulWidget {
  const StudentQuizzesScreen({super.key});

  @override
  State<StudentQuizzesScreen> createState() => _StudentQuizzesScreenState();
}

class _StudentQuizzesScreenState extends State<StudentQuizzesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Quizzes'),
      ),
      body: Column(
        children: [
          Expanded(
              child: ListView.builder(
                  itemCount: 10,
                  itemBuilder: (BuildContext context, index) {
                    return StudentQuizzesItemsWidget(index: index + 1);
                  }))
        ],
      ),
    );
  }
}
