import 'package:braincarrier/src/ui/screens/get_start_screen.dart';
import 'package:braincarrier/src/ui/widgets/common_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
                  Text(
                    'Enter Email address nad password',
                    style: subtitleTextStyle,
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
                          child: CommonElevatedButton(
                            title: 'next',
                            onTap: () {
                              if (_formKey.currentState!.validate()) {
                                emailVerifyController.text = '';
                                passWordController.text = '';
                                ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                        content: Text('LogIn Success ')));
                              }
                            },
                          )),
                  const SizedBox(
                    height: 14,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Wrap(
                        crossAxisAlignment: WrapCrossAlignment.center,
                        children: [
                          Text(
                            'Don\'t have an account',
                            style: subtitleTextStyle,
                          ),
                          TextButton(
                              onPressed: () {
                                Get.to(const GetStartedScreen());
                              },
                              child: Text(
                                'SignUp',
                                style: subtitleTextStyle.copyWith(
                                    color: primaryColor),
                              ))
                        ],
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}
