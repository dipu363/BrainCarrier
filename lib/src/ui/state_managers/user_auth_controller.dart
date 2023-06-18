import 'package:braincarrier/src/ui/screens/login_screen.dart';
import 'package:braincarrier/src/ui/screens/student/studen_deshboard.dart';
import 'package:braincarrier/src/ui/screens/teacher/teacher_deshboard.dart';

import 'package:braincarrier/src/ui/util/app_colors.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserAuthController extends GetxController {
  static UserAuthController instance = Get.find();
  bool _emailVerificationInProgress = false;
  bool get emailVerificationInProgress => _emailVerificationInProgress;

  late Rx<User?> _user;

  FirebaseAuth auth = FirebaseAuth.instance;

  @override
  void onReady() {
    // user logged in or out
    _user = Rx<User?>(auth.currentUser);
    // user would be notified
    _user.bindStream(auth.userChanges());

    ever(_user, _initialScreen);
  }

  _initialScreen(User? user) {
    if (user == null) {
      Get.offAll(const LogInScreen());
    } else {
      Get.offAll(const LogInScreen());
    }
  }

  Future<bool> isLogIn() async {
    return true;
  }

  Future<void> createUser(
      String email, String password, String userRole) async {
    _emailVerificationInProgress = true;
    try {
      await auth.createUserWithEmailAndPassword(
          email: email, password: password);
      if (auth.currentUser != null) {
        _emailVerificationInProgress = false;
        Get.snackbar('About User', 'User Message',
            backgroundColor: primaryColor,
            titleText: const Text(
              'Create Account',
              style: TextStyle(color: Colors.white),
            ),
            snackPosition: SnackPosition.BOTTOM,
            messageText: const Text('Account Creation Successful'));
        if (userRole == 'Teacher') {
          Get.offAll(() => const TeacherDashboard());
        } else {
          Get.offAll(() => const StudentDashboard());
        }
      }
    } catch (e) {
      Get.snackbar('About User', 'User Message',
          backgroundColor: primaryColor,
          titleText: const Text(
            'Account Creation failed',
            style: TextStyle(color: Colors.white),
          ),
          snackPosition: SnackPosition.BOTTOM,
          messageText: Text(
            e.toString(),
            style: const TextStyle(color: Colors.black),
          ));
    }
  }
}
