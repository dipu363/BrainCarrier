import 'package:braincarrier/src/data/quiz_model.dart';
import 'package:braincarrier/src/ui/widgets/quize_title_widge.dart';
import 'package:flutter/material.dart';

import '../util/app_colors.dart';

class TeacherQuizItemsWidget extends StatelessWidget {
  const TeacherQuizItemsWidget({
    super.key,
    required this.index, required this.quiz,
  });

  final int index;
  final QuizModel quiz;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16, top: 8, bottom: 8),
      child: Container(
        height: 300,
        decoration: BoxDecoration(
            color: primaryColor.withOpacity(.1),
            borderRadius: BorderRadius.circular(15)),
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.white.withOpacity(.8),
                          borderRadius: BorderRadius.circular(15)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          QuizeTitleWidget(index: index,quizModel: quiz,),
                           Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              quiz.description!,
                              style: const TextStyle(
                                fontSize: 14,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      '==> ${quiz.totalQuestion!} Questions Available',style: const TextStyle(color: Colors.black),),
                    Text(
                      '==> Marks = ${quiz.marks!}',style: const TextStyle(color: Colors.black),),


                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                      onPressed: () {},
                      child: const Text('Questions',
                          style: TextStyle(color: primaryColor))),
                  const SizedBox(
                    width: 10,
                  ),
                  ElevatedButton(
                      onPressed: () {},
                      child: const Text('Result',
                          style: TextStyle(color: primaryColor))),
                  const SizedBox(
                    width: 10,
                  ),
                  ElevatedButton(
                      onPressed: () {},
                      child: const Text('Update',
                          style: TextStyle(
                            color: primaryColor,
                          ))),

                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
