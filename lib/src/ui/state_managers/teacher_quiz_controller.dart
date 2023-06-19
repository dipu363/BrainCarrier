

import 'package:braincarrier/src/data/quiz_model.dart';
import 'package:braincarrier/src/ui/state_managers/user_auth_controller.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';



class TeacherQuizController extends GetxController{
  static TeacherQuizController get instance => Get.find();
  bool _adddingPrograss = false;
  bool  get adddingPrograss => _adddingPrograss;
  final _db = FirebaseFirestore.instance;
  var authController = UserAuthController.instance;
  List <QuizModel> _allquiz = [];
  List <QuizModel>  get allquiz => _allquiz;





  // create user
  Future<void> saveQuiz(QuizModel quiz) async {

    _db
        .collection("Quizzes")
        .add(quiz.toJson())
        .whenComplete(
          () => Get.snackbar(
        'Success',
        'Quiz has been created.',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green.withOpacity(.1),
        colorText: Colors.green,
      ),
    )
        .catchError((onError) {
      print('  =========================${onError.toString()}');
      Get.snackbar('Failed!', ' ${onError.toString()}',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red.withOpacity(.1),
          colorText: Colors.red);
    });
  }

  Future<void> getAllQuizByUser(String userid) async {
    print(userid);
    final snapshot = await _db.collection('Quizzes').where(userid,isEqualTo: userid).get();
     final quiz = snapshot.docs
        .map((document) => QuizModel.fromSnapshot(document))
        .toList();
     print('quiz.toString()=================================');
     print(quiz.toString());
     update();

  }




}