import 'package:braincarrier/src/ui/screens/student/student_quiz_screen.dart';
import 'package:braincarrier/src/ui/state_managers/user_auth_controller.dart';
import 'package:braincarrier/src/ui/util/app_colors.dart';
import 'package:braincarrier/src/ui/util/style.dart';
import 'package:braincarrier/src/ui/widgets/menu_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class StudentDashboard extends StatefulWidget {
  const StudentDashboard({super.key});

  @override
  State<StudentDashboard> createState() => _StudentDashboardState();
}

class _StudentDashboardState extends State<StudentDashboard> {
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
          actions: [
            IconButton(onPressed: (){
              UserAuthController.instance.signOut();
            }, icon: const Icon(Icons.person_outline))
          ],
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
                            Get.to(const StudentQuizzesScreen());
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
                          title: 'Leader Board',
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
