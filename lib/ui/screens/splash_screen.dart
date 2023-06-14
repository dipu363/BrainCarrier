
import 'dart:developer';


import 'package:braincarrier/ui/screens/get_start_screen.dart';
import 'package:braincarrier/ui/screens/login_screen.dart';
import 'package:braincarrier/ui/util/style.dart';
import 'package:flutter/material.dart';

import '../util/app_colors.dart';
import 'package:get/get.dart';
class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {


  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 10)).then((value)async {
      Get.offAll((const LogInScreen()));
    });

  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                      child: Image.asset('assets/images/logo.jpg',height: 150,)
                  ),

                  const Text('Brain Carrier',style: TextStyle (color: primaryColor,fontWeight: FontWeight.w700,fontSize: 24),),
                  Text('Share Your Knowledge With Us.',style: subtitleTextStyle,),
                ],
              )
          ) ,

          const Column(
            children: [
              CircularProgressIndicator(color: primaryColor,),
              Padding(
                padding: EdgeInsets.all(16.0),
                child: Text('Version 1.0',style: TextStyle(
                    fontSize: 12,
                    color: grayColor,
                    letterSpacing: 0.6
                ),
                ),
              ),

            ],
          )



        ],
      ),
    );
  }
}
