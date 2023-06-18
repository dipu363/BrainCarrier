import 'package:flutter/material.dart';

import '../util/app_colors.dart';

class QuizeTitleWidget extends StatelessWidget {
  const QuizeTitleWidget({
    super.key,
    required this.index,
  });

  final int index;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.yellow,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Quiz: $index',
                  style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: primaryColor),
                ),
                const Text(
                  'Subject: Easy Quiz ',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: 60,
            decoration: const BoxDecoration(
              border: Border(),
            ),
            child: const Card(
                elevation: 5,
                color: Colors.black,
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.access_time_rounded,
                        color: Colors.white,
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      Text('alive',
                          style: TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                              fontWeight: FontWeight.bold)),
                    ],
                  ),
                )),
          ),
        ],
      ),
    );
  }
}
