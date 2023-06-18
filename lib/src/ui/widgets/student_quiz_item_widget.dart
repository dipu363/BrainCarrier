import 'package:braincarrier/src/ui/widgets/quize_title_widge.dart';
import 'package:flutter/material.dart';

import '../util/app_colors.dart';
import '../util/style.dart';

class StudentQuizzesItemsWidget extends StatelessWidget {
  const StudentQuizzesItemsWidget({
    super.key,
    required this.index,
  });

  final int index;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16, top: 8, bottom: 8),
      child: Container(
        height: 300,
        decoration: BoxDecoration(
            color: primaryColor.withOpacity(.2),
            borderRadius: BorderRadius.circular(15)),
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Padding(
                          padding: EdgeInsets.all(4.0),
                          child: CircleAvatar(
                              radius: 25,
                              backgroundColor: graySoftColor,
                              child: Icon(
                                Icons.person_outline,
                                color: Colors.black,
                              )),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Dipu',
                                style: titleTextStyle.copyWith(fontSize: 20)),
                            Text('Quiz Author', style: subtitleTextStyle),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.white.withOpacity(.4),
                          borderRadius: BorderRadius.circular(15)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          QuizeTitleWidget(index: index),
                          const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              'This is mcq test for 20 minutes ,20 marks answer the all questions',
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ElevatedButton(
                      onPressed: () {},
                      child: const Text('LEADER BOARD',
                          style: TextStyle(color: primaryColor))),
                  const SizedBox(
                    width: 10,
                  ),
                  ElevatedButton(
                      onPressed: () {},
                      child: const Text(
                        'GET START',
                        style: TextStyle(color: primaryColor),
                      )),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
