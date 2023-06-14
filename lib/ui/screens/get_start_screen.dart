
import 'package:braincarrier/ui/screens/signup_screen.dart';
import 'package:braincarrier/ui/util/app_colors.dart';
import 'package:braincarrier/ui/widgets/common_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GetStartedScreen extends StatefulWidget {
  const GetStartedScreen({Key? key}) : super(key: key);

  @override
  State<GetStartedScreen> createState() => _GetStartedScreenState();
}

class _GetStartedScreenState extends State<GetStartedScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
                child: Image.asset(
              'assets/images/logo.jpg',
              height: 150,
            )),
            const Text(
              'Get Started As ',
              style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: primaryColor),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CommonElevatedButton(
                      title: 'Teacher',
                      onTap: () {
                        Get.to(const SignUpScreen(userRole: 'Teacher',));
                      }),
                  const SizedBox(
                    width: 8.0,
                  ),
                  CommonElevatedButton(
                      title: 'Student',
                      onTap: () {
                        Get.to(const SignUpScreen(userRole: 'Student'));
                      }),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

