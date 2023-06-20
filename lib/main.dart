import 'package:braincarrier/src/ui/screens/splash_screen.dart';
import 'package:braincarrier/src/ui/state_managers/add_question_controller.dart';
import 'package:braincarrier/src/ui/state_managers/profile_controller.dart';
import 'package:braincarrier/src/ui/state_managers/teacher_quiz_controller.dart';
import 'package:braincarrier/src/ui/state_managers/user_auth_controller.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp().then((value) => Get.put(UserAuthController()));
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialBinding: GetXBindings(),
      title: 'BrainCarrier',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const SplashScreen(),
    );
  }
}

class GetXBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(ProfileController());
    Get.put(TeacherQuizController());
    Get.put(AddQuestionController());
  }
}
