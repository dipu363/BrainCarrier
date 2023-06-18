import 'package:braincarrier/src/ui/screens/teacher/teacher_quiz_screen.dart';
import 'package:braincarrier/src/ui/util/app_colors.dart';
import 'package:braincarrier/src/ui/util/style.dart';
import 'package:braincarrier/src/ui/widgets/menu_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TeacherDashboard extends StatefulWidget {
  const TeacherDashboard({super.key});

  @override
  State<TeacherDashboard> createState() => _TeacherDashboardState();
}

class _TeacherDashboardState extends State<TeacherDashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: InkWell(
              onTap: () {},
              child: const Icon(
                Icons.arrow_back_ios_new,
                color: primaryColor,
              )),
          title: const Text('Dashboard'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 80,
                    width: 80,
                    child: CircleAvatar(
                      backgroundColor: primaryColor.withOpacity(.7),
                      child: const Icon(
                        Icons.person,
                        size: 60,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 16.0, right: 16),
                    child: Container(
                      width: 2,
                      height: 80,
                      decoration: const BoxDecoration(color: primaryColor),
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Giyas Uddin',
                        style: titleTextStyle,
                      ),
                      Text(
                        '01933932636',
                        style: subtitleTextStyle,
                      ),
                    ],
                  )
                ],
              ),
              const SizedBox(
                height: 50,
              ),
              Expanded(
                  child: SingleChildScrollView(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        MenuCardWidget(
                          title: 'Open Quizzes',
                          onTap: () {
                            Get.to(const TeacherQuizScreen());
                          },
                        ),
                        const SizedBox(width: 20),
                        MenuCardWidget(
                          title: 'Ongoing Quizzes',
                          onTap: () {},
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        MenuCardWidget(
                          title: 'Result',
                          onTap: () {},
                        ),
                        const SizedBox(width: 20),
                        MenuCardWidget(
                          title: 'Profile',
                          onTap: () {},
                        ),
                      ],
                    )
                  ],
                ),
              )),
            ],
          ),
        ));
  }
}
