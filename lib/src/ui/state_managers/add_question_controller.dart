import 'package:braincarrier/src/ui/state_managers/user_auth_controller.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../data/question_model.dart';

class AddQuestionController extends GetxController{
  static AddQuestionController get instance => Get.find<AddQuestionController>();
  final _db = FirebaseFirestore.instance;
  List <QuestionModel> _allQuestion = [];
  List <QuestionModel>  get allQuestion => _allQuestion;

  int _questionLength =0;
  int get questionLength => _questionLength;

  // create user
  Future<void> saveQuestion(QuestionModel question) async {

    _db
        .collection("Questions")
        .add(question.toJson())
        .whenComplete(
          () => Get.snackbar(
        'Success',
        'Question has been Added.',
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

  Future<void> getAllQuestion(String quizId) async {
    var currentUser = UserAuthController.instance.firebaseUser.value!.uid;
    print(currentUser);
    final snapshot = await _db.collection('Questions').where('quizId',isEqualTo: quizId).get();
    _allQuestion = snapshot.docs
        .map((document) => QuestionModel.fromSnapshot(document))
        .toList();
    print('Question.toString()=================================');
    print(quizId);
    print(_allQuestion.length);
    _questionLength = _allQuestion.length;
    update();
    print(_allQuestion.last.quizId);


  }

}