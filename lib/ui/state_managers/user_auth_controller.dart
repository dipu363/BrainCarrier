
import 'package:get/get.dart';
class UserAuthController extends GetxController{

  bool _emailVerificationInProgress = false;
  bool _otpVerificationInProgress = false;

  bool get emailVerificationInProgress => _emailVerificationInProgress;

  bool get otpVerificationInProgress => _otpVerificationInProgress;


Future<bool> isLogIn() async{
  _emailVerificationInProgress = true;
  return true;

}

}