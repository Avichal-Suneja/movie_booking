import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'auth_controller.dart';


class AuthView extends StatelessWidget {
  const AuthView({Key? key}) : super(key: key);

  // @override
  // Widget build(BuildContext context) {
  //   final controller = Get.find<AuthController>();
  //   return Obx(() =>
  //   controller.signUpBool.value
  //       ? showSignIn(controller)
  //       : showSignUp(controller));
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: Get.height,
        width: Get.width,
        color: Color(0xff303438),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Welcome', style: TextStyle(
              color: Color(0xffEFAE28),
              fontSize: 48,
              fontWeight: FontWeight.bold,
            ),),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 8.0, 0, 0),
              child: Text('Book Your Favourite Movie Shows Here',
                style: TextStyle(
                    color: Color(0xff666a6e),
                    fontSize: 18
                ),),
            ),
            Image(
                image: AssetImage('assets/welcome_page.png')
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(100),
              child: SizedBox(
                height: 64,
                width: 350,
                child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                        primary: Color(0xffEFAE28),
                        elevation: 10
                    ),
                    child: Text('Get Started',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 24,
                          fontWeight: FontWeight.bold
                      ),)
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget showSignIn(BuildContext context) {
    return Scaffold(
      body: Container(

      ),
    );
  }
}

