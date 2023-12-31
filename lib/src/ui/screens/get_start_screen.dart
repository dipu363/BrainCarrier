import 'package:braincarrier/src/ui/screens/signup_screen.dart';
import 'package:braincarrier/src/ui/util/app_colors.dart';
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
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: primaryColor,
                    ),
                    onPressed: () {
                      Get.to(const SignUpScreen(userRole: 'Teacher'));
                    },
                    child: const Text('Teacher',
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: Colors.white)),
                  ),
                  const SizedBox(
                    width: 8.0,
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: primaryColor,
                    ),
                    onPressed: () {
                      Get.to(const SignUpScreen(userRole: 'Student'));
                    },
                    child: const Text('Student',
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: Colors.white)),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
