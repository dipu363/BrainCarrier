import 'package:braincarrier/src/ui/screens/login_screen.dart';
import 'package:braincarrier/src/ui/screens/student/studen_deshboard.dart';
import 'package:braincarrier/src/ui/screens/teacher/teacher_deshboard.dart';
import 'package:braincarrier/src/ui/state_managers/profile_controller.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserAuthController extends GetxController {
  static UserAuthController get instance => Get.find<UserAuthController>();

  bool _userCreateProgress = false;
  bool get userCreateProgress => _userCreateProgress;

  bool _loginProgress = false;
  bool get loginProgress => _loginProgress;

  late Rx<User?> firebaseUser;

  final _auth = FirebaseAuth.instance;

  @override
  void onReady()  {
    // user logged in or out
    firebaseUser = Rx<User?>(_auth.currentUser);
    // user would be notified
    firebaseUser.bindStream(_auth.userChanges());
    ever(firebaseUser, _initialScreen);
  }

  _initialScreen(User? user)async{
    // this dart standard if condition checking


    // it is any language standard
    if (user == null) {
      print('login---------ooo--------$user');
      Get.offAll(() => const LogInScreen());
    } else {
      String email = user.email.toString();
      print('login------1-----------$email');
      var profileController = Get.find<ProfileController>();
      var userinfo = await profileController.getUserInfo(email);
      print('login------2-----------${userinfo.uRole}');
      if (userinfo.uRole == 'Teacher') {
        print('login------3-----------$email');
        Get.off(()=>const TeacherDashboard());
        print('login------4-----------$email');
      } else {
        Get.off(()=>const StudentDashboard());
        print('login------5-----------$email');
      }
    }
  }

  void createUser(String email, String password, String userRole) async {
    _userCreateProgress = true;
    update();
    await _auth
        .createUserWithEmailAndPassword(email: email, password: password);

    if(firebaseUser.value != null){
      _userCreateProgress = false;
      update();
      if (userRole == 'Teacher') {
        Get.off(() => const TeacherDashboard());
      } else {
        Get.off(() => const StudentDashboard());
      }
      Get.snackbar(
        'Success',
        'Account has been Success',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green.withOpacity(.1),
        colorText: Colors.green,
      );

    }else{
      Get.snackbar(
        'Failed',
        'Account Creation failed',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green.withOpacity(.1),
        colorText: Colors.green,

      );
    }
  }

  Future<void> loggedIn(String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      print('  ============logIn()=============${_auth.currentUser!.email}');
    } catch (e) {

      print('  ============logIn()=============${e.toString()}');
      Get.snackbar('Failed!', ' ${e.toString()}',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red.withOpacity(.1),
          colorText: Colors.red);
    }
  }

  Future<void> signOut() async => await _auth
      .signOut();

}
