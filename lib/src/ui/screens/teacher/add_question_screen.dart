import 'package:braincarrier/src/data/quiz_model.dart';
import 'package:braincarrier/src/ui/util/style.dart';
import 'package:flutter/material.dart';

import '../../util/app_colors.dart';
import '../../widgets/common_edittext_field.dart';
import '../../widgets/common_elevated_button.dart';
import '../../widgets/question_widget.dart';
import 'package:get/get.dart';

class AddQuestionScreen extends StatefulWidget {
  const AddQuestionScreen({super.key, required this.quiz});
  final QuizModel quiz;
  @override
  State<AddQuestionScreen> createState() => _AddQuestionScreenState();
}

class _AddQuestionScreenState extends State<AddQuestionScreen> {
  bool ischecked1 = false;
  bool ischecked2 = false;
  bool ischecked3 = false;
  bool ischecked4 = false;




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
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Wrap(children: [
                        Text(
                          'Quiz ',
                          style: titleTextStyle.copyWith(color: primaryColor),
                        ),
                        Text(
                          'ID:',
                          style: titleTextStyle.copyWith(color: primaryColor),
                        )
                      ]),
                    ],
                  ),
                  Row(
                    children: [
                      Wrap(children: [
                        Text(
                          'Total question: ',
                          style: titleTextStyle.copyWith(color: primaryColor),
                        ),
                        Text(
                          '0',
                          style: titleTextStyle.copyWith(color: primaryColor),
                        )
                      ]),
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              QuestionWidget(
                controller: TextEditingController(),
                validator: (value) {
                  if (value == null) {
                    return const Text('Enter your question ');
                  } else {
                    return null;
                  }
                },
                hintText: 'Type your question here',
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  Checkbox(
                      value: ischecked1,
                      onChanged: (bool? value) {
                        setState(() {
                          ischecked1 = value!;
                        });
                      },
                      activeColor: Colors.green,
                      checkColor: Colors.black),
                  Expanded(
                    child: CommonEditTextField(
                        controller: TextEditingController(),
                        validator: (value) {
                          if (value == null) {
                            return const Text('Enter an Option ');
                          } else {
                            return null;
                          }
                        },
                        hintext: 'Option 1'),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  Checkbox(
                      value: ischecked2,
                      onChanged: (bool? value) {
                        setState(() {
                          ischecked2 = value!;
                        });
                      },
                      activeColor: Colors.green,
                      checkColor: Colors.black),
                  Expanded(
                    child: CommonEditTextField(
                        controller: TextEditingController(),
                        validator: (value) {
                          if (value == null) {
                            return const Text('Enter an Option ');
                          } else {
                            return null;
                          }
                        },
                        hintext: 'Option 2'),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  Checkbox(
                      value: ischecked3,
                      onChanged: (bool? value) {
                        setState(() {
                          ischecked3 = value!;
                        });
                      },
                      activeColor: Colors.green,
                      checkColor: Colors.black),
                  Expanded(
                    child: CommonEditTextField(
                        controller: TextEditingController(),
                        validator: (value) {
                          if (value == null) {
                            return const Text('Enter an Option ');
                          } else {
                            return null;
                          }
                        },
                        hintext: 'Option 3'),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  Checkbox(
                      value: ischecked4,
                      onChanged: (bool? value) {
                        setState(() {
                          ischecked4 = value!;
                        });
                      },
                      activeColor: Colors.green,
                      checkColor: Colors.black),
                  Expanded(
                    child: CommonEditTextField(
                      controller: TextEditingController(),
                      validator: (value) {
                        if (value == null) {
                          return const Text('Enter an Option ');
                        } else {
                          return null;
                        }
                      },
                      hintext: 'Option 4',
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              CommonElevatedButton(title: 'Add', onTap: () {}),
            ],
          ),
        ),
      ),
    );
  }
}
