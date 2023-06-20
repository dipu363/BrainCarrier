import 'package:braincarrier/src/data/question_model.dart';
import 'package:braincarrier/src/data/quiz_model.dart';
import 'package:braincarrier/src/ui/state_managers/add_question_controller.dart';
import 'package:braincarrier/src/ui/util/style.dart';
import 'package:flutter/material.dart';

import '../../state_managers/user_auth_controller.dart';
import '../../util/app_colors.dart';
import '../../widgets/common_edittext_field.dart';
import '../../widgets/common_elevated_button.dart';
import '../../widgets/question_widget.dart';
import 'package:get/get.dart';

class AddQuestionScreen extends StatefulWidget {
  const AddQuestionScreen({super.key, required this.quizId, required this.quiz});
  final String quizId;
  final QuizModel quiz;
  @override
  State<AddQuestionScreen> createState() => _AddQuestionScreenState();
}

class _AddQuestionScreenState extends State<AddQuestionScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  var ctlQuestion = TextEditingController();
  var ctlOptionA = TextEditingController();
  var ctlOptionB = TextEditingController();
  var ctlOptionC = TextEditingController();
  var ctlOptionD = TextEditingController();
  var ctlAnswer  = TextEditingController();
  var questionlength ;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    AddQuestionController.instance.getAllQuestion(widget.quizId);
    questionlength = AddQuestionController.instance.questionLength;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
            onTap: () {
              Get.back();
            },
            child: const Icon(
              Icons.arrow_back_ios_new,
              color: primaryColor,
            )),
        title: const Text('Add Question'),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Quiz ID : ${widget.quizId}',
                      style: titleTextStyle.copyWith(color: primaryColor),
                    ),
                    Text(
                      'Total question:$questionlength / ${widget.quiz.totalQuestion}',
                      style: titleTextStyle.copyWith(color: primaryColor),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                QuestionWidget(
                  controller: ctlQuestion,
                  validator: (value) {
                    if (value?.isEmpty??true) {
                      return 'Enter your question ';
                    } else {
                      return null;
                    }
                  },
                  hintText: 'Type your question here',
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CircleAvatar(
                        backgroundColor: primaryColor.withOpacity(.3),
                        child: const Text('A',style:TextStyle(color: Colors.black),),
                      ),
                    ),
                    Expanded(
                      child: CommonEditTextField(
                          controller: ctlOptionA,
                          validator: (value) {
                            if (value?.isEmpty??true) {
                              return 'Enter Option A';
                            } else {
                              return null;
                            }
                          },
                          hintext: 'Option A'),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CircleAvatar(
                        backgroundColor: primaryColor.withOpacity(.3),
                        child: const Text('B',style:TextStyle(color: Colors.black),),
                      ),
                    ),
                    Expanded(
                      child: CommonEditTextField(
                          controller: ctlOptionB,
                          validator: (value) {
                            if (value?.isEmpty??true) {
                              return 'Enter Option B';
                            } else {
                              return null;
                            }
                          },
                          hintext: 'Option B'),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CircleAvatar(
                        backgroundColor: primaryColor.withOpacity(.3),
                        child: const Text('C',style:TextStyle(color: Colors.black),),
                      ),
                    ),
                    Expanded(
                      child: CommonEditTextField(
                          controller: ctlOptionC,
                          validator: (value) {
                            if (value?.isEmpty??true) {
                              return'Enter Option C';
                            } else {
                              return null;
                            }
                          },
                          hintext: 'Option C'),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CircleAvatar(
                        backgroundColor: primaryColor.withOpacity(.3),
                        child: const Text('D',style:TextStyle(color: Colors.black),),
                      ),
                    ),
                    Expanded(
                      child: CommonEditTextField(
                        controller: ctlOptionD,
                        validator: (value) {
                          if (value?.isEmpty??true) {
                            return 'Enter Option D';
                          } else {
                            return null;
                          }
                        },
                        hintext: 'Option D',
                      ),
                    ),
                  ],
                ),const SizedBox(height: 10),
                Row(
                  children: [
                    Expanded(
                      child: CommonEditTextField(
                        controller: ctlAnswer,
                        validator: (value) {
                          if (value?.isEmpty??true) {
                            return 'Enter Accepted Answer ';
                          } else {
                            return null;
                          }
                        },
                        hintext: 'Accepted Answer',
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                CommonElevatedButton(title: 'Next', onTap: () {
                  if(_formKey.currentState!.validate()){

                      var ques = QuestionModel(
                          quizId: widget.quiz.quizId,
                          question: ctlQuestion.text,
                          optionA: ctlOptionA.text,
                          optionB: ctlOptionB.text,
                          optionC: ctlOptionC.text,
                          optionD: ctlOptionD.text,
                          answer: ctlAnswer.text
                      );
                      AddQuestionController.instance.saveQuestion(ques);
                      //_clear();
                      AddQuestionController.instance.getAllQuestion(widget.quizId);
                  }



                }),
              ],
            ),
          ),
        ),
      ),
    );
  }


  void _clear(){
     ctlQuestion.text = '';
     ctlOptionA.text= '';
     ctlOptionB .text= '';
     ctlOptionC .text= '';
     ctlOptionD.text = '';
     ctlAnswer .text ='';
  }
}
