import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

import '../state_managers/user_auth_controller.dart';
import '../util/app_colors.dart';
import '../util/style.dart';
import '../widgets/common_edittext_field.dart';

class LogInScreen extends StatefulWidget {
  const LogInScreen({Key? key}) : super(key: key);

  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  TextEditingController emailVerifyController = TextEditingController();
  TextEditingController passWordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<UserAuthController>(builder: (authController) {
        return Padding(
          padding: const EdgeInsets.all(36.0),
          child: Center(
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/logo.jpg',
                    height: 80,
                    width: 80,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Welcom Back',
                    style: titleTextStyle,
                  ),
                  const SizedBox(height: 24),
                  CommonEditTextField(
                    controller: emailVerifyController,
                    validator: (String? value) {
                      if (value?.isEmpty ?? true) {
                        return 'Please Enter Valid Email Address';
                      } else {
                        return null;
                      }
                    },
                    hintext: 'Email Address',
                  ),
                  const SizedBox(height: 8),
                  TextFormField(
                    controller: passWordController,
                    obscureText: true,
                    validator: (String? value) {
                      if (value?.isEmpty ?? true) {
                        return 'Please Enter your password ';
                      } else {
                        return null;
                      }
                    },
                    decoration: const InputDecoration(
                        hintText: 'Password',
                        contentPadding:
                            EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                        border: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: primaryColor, width: 2)),
                        enabledBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: primaryColor, width: 2))),
                  ),
                  const SizedBox(height: 16),
                  authController.emailVerificationInProgress
                      ? const CircularProgressIndicator()
                      : SizedBox(
                    width: double.infinity,
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: primaryColor,
                            ),
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {


                                emailVerifyController.text ='';
                                passWordController.text = '';
                                ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                        content: Text('LogIn Success ')));
                              }
                            },
                            child: const Text('Next',
                                style: TextStyle(
                                  fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white)),
                          ),
                      ),
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}
