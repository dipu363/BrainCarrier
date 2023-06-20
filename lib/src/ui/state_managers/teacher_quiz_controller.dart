import 'package:braincarrier/src/data/quiz_model.dart';
import 'package:braincarrier/src/ui/state_managers/user_auth_controller.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TeacherQuizController extends GetxController {
  static TeacherQuizController get instance => Get.find<TeacherQuizController>();

  final _db = FirebaseFirestore.instance;
  List<QuizModel> _allquiz = [];
  List<QuizModel> get allquiz => _allquiz;

  String  _quizId ='';
  String get quizId => _quizId;


  // create user
  Future<void> saveQuiz(QuizModel quiz) async {
    _db
        .collection("Quizzes")
        .add(quiz.toJson())
        .then((value) => _quizId = value.id)
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

  Future<void> getAllQuizByUser() async {
    var currentUser = UserAuthController.instance.firebaseUser.value!.uid;
    print(currentUser);
    final snapshot = await _db
        .collection('Quizzes')
        .where('userid', isEqualTo: currentUser)
        .get();
    _allquiz = snapshot.docs
        .map((document) => QuizModel.fromSnapshot(document))
        .toList();
    print('quiz.toString()=================================');
    print(_allquiz.length);
    print(allquiz.last.quizId);

    update();
  }
  Future<void> getAllQuiz() async {

    final snapshot = await _db
        .collection('Quizzes')
        .get();
    _allquiz = snapshot.docs
        .map((document) => QuizModel.fromSnapshot(document))
        .toList();
    print('quiz.toString()=================================');
    print(_allquiz.length);
    print(allquiz.last.quizId);

    update();
  }
}
