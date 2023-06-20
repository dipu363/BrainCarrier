
import 'package:braincarrier/src/data/quiz_model.dart';
import 'package:braincarrier/src/ui/screens/teacher/add_question_screen.dart';
import 'package:braincarrier/src/ui/state_managers/teacher_quiz_controller.dart';
import 'package:braincarrier/src/ui/state_managers/user_auth_controller.dart';
import 'package:flutter/material.dart';

import '../../util/app_colors.dart';
import '../../widgets/common_edittext_field.dart';
import '../../widgets/common_elevated_button.dart';
import 'package:get/get.dart';
class AddQuizScreen extends StatefulWidget {
  const AddQuizScreen({Key? key}) : super(key: key);

  @override
  State<AddQuizScreen> createState() => _AddQuizScreenState();
}

class _AddQuizScreenState extends State<AddQuizScreen> {

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  var quizTitle = TextEditingController();
  var description = TextEditingController();
  var totalQuestion = TextEditingController();
  var marks = TextEditingController();
  var status = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading:  IconButton(
          color: primaryColor, onPressed: () {
            Get.back();
        },
          icon: const Icon(Icons.arrow_back_ios),
        ),
        title: const Text('Add Quiz'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
                child: Column(
                  children: [
                    CommonEditTextField(
                        controller: quizTitle,
                        validator: (String? value) {
                          if (value?.isEmpty?? true) {
                            return 'type quiz title';
                          } else {
                            return null;
                          }
                        },
                        hintext: 'Quiz title'),
                    const SizedBox(height: 10),
                    CommonEditTextField(
                        controller: description,
                        validator: (String? value) {
                          if (value?.isEmpty?? true) {
                            return 'quiz description ';
                          } else {
                            return null;
                          }
                        },
                        hintext: 'short description'),
                    const SizedBox(height: 10),

                    CommonEditTextField(
                        controller: totalQuestion,
                        validator: (String? value) {
                          if (value?.isEmpty?? true) {
                            return ' Type Total question';
                          } else {
                            return null;
                          }
                        },
                        hintext: 'Total Question '),
                    const SizedBox(height: 10),
                    CommonEditTextField(
                        controller: marks,
                        validator: (String ?value) {
                          if (value?.isEmpty?? true) {
                            return ' Type Total marks';
                          } else {
                            return null;
                          }
                        },
                        hintext: 'Marks '),
                    const SizedBox(height: 10),
                    CommonEditTextField(
                        controller: status,
                        validator: (String ? value) {
                          if (value?.isEmpty?? true) {
                            return 'type status ';
                          } else {
                            return null;
                          }
                        },
                        hintext: 'status'),
                    const SizedBox(
                      height: 20,
                    ),

                    CommonElevatedButton(title: 'Go Next', onTap: (){
                      if(_formKey.currentState!.validate()){
                       var user = UserAuthController.instance.firebaseUser.value;
                       if(user != null){
                        // print(user.uid);
                        // print(user.email);
                         var quiz = QuizModel(
                             userid: user.uid,
                             title: quizTitle.text,
                             description: description.text,
                             totalQuestion: totalQuestion.text,
                             marks: marks.text,
                             status: status.text
                         );
                         TeacherQuizController.instance.saveQuiz(quiz);
                         Get.to( AddQuestionScreen( quizId: TeacherQuizController.instance.quizId, quiz:quiz,));
                       }


                      }



                    }),
                  ],
                )


          ),
        ),
      ),
    );

  }
}
