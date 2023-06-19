

import 'package:cloud_firestore/cloud_firestore.dart';

class QuizModel{
  final String ? quizId;
  final String ? userid;
  final String ? title;
  final String ? description;
  final String ? totalQuestion;
  final String ? marks;
  final String ? status;




  QuizModel({this.quizId,  this.userid,  this.title,  this.description,
     this.totalQuestion, this.marks, this.status,});

  toJson() {
    return {
      "userid": userid,
      "title": title,
      "description": description,
      "totalQuestion": totalQuestion,
      "marks": marks,
      "status": status,

    };
  }

  factory QuizModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    final data = document.data()!;


    return QuizModel(
        quizId:document.id,
        userid: data['userid'], // key name to be db column name
        title: data['title'],
        description: data['description'],
        marks: data['marks'],
        totalQuestion: data['totalQuestion'],
        status: data['status'],
    );

  }



}