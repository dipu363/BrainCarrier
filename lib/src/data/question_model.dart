
import 'package:cloud_firestore/cloud_firestore.dart';

class QuestionModel{

  final String ? questionId;
  final String ? quizId;
  final String ? question;
  final String ? optionA;
  final String ? optionB;
  final String ? optionC;
  final String ? optionD;
  final String ? answer;

  QuestionModel({this.questionId,this.quizId, this.question, this.optionA, this.optionB,
      this.optionC, this.optionD, this.answer,});



  toJson() {
    return {
      "quizId": quizId,
      "question": question,
      "optionA": optionA,
      "optionB": optionB,
      "optionC": optionC,
      "optionD": optionD,
      "answer": answer,

    };



  }

  factory QuestionModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    final data = document.data()!;


    return QuestionModel(
      questionId:document.id,
      quizId: data['quizId'], // key name to be db column name
      question: data['question'],
      optionA: data['optionA'],
      optionB: data['optionB'],
      optionC: data['optionC'],
      optionD: data['optionD'],
      answer: data['answer'],
    );

  }
}

