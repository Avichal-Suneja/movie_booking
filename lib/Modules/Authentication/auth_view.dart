import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'auth_controller.dart';

class AuthView extends StatelessWidget {
  const AuthView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AuthController());
    return Scaffold(
        body: Obx(() => controller.screenNum.value == 1
            ? showWelcomePage(controller)
            : controller.screenNum.value == 2
                ? showSignIn(controller)
                : showSignUp(controller)));
  }
}

Widget showWelcomePage(AuthController controller) {
  return Container(
    height: Get.height,
    width: Get.width,
    color: Color(0xff2c2e43),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Welcome',
          style: TextStyle(
            color: Color(0xffffd523),
            fontSize: 48,
            fontWeight: FontWeight.bold,
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 8.0, 0, 0),
          child: Text(
            'Book Your Favourite Movie Shows Here',
            style: TextStyle(color: Color(0xffb2b1b9), fontSize: 18),
          ),
        ),
        Image(image: AssetImage('assets/welcome_page.png')),
        ClipRRect(
          borderRadius: BorderRadius.circular(100),
          child: SizedBox(
            height: 64,
            width: 350,
            child: ElevatedButton(
                onPressed: () {
                  controller.screenNum.value = 2;
                },
                style: ElevatedButton.styleFrom(
                    primary: Color(0xffffd523), elevation: 10),
                child: Text(
                  'Get Started',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 24,
                      fontWeight: FontWeight.bold),
                )),
          ),
        )
      ],
    ),
  );
}

Widget showSignIn(AuthController controller) {
  return Container(
      height: Get.height,
      width: Get.width,
      color: Color(0xff2c2e43),
      child: Form(
        key: controller.formKey_1,
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Text(
                  'Sign-In',
                  style: TextStyle(
                    color: Color(0xffffd523),
                    fontSize: 48,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: 32),
              Padding(
                padding: const EdgeInsets.fromLTRB(40.0, 0, 0, 0),
                child: Text(
                  'Phone Number',
                  style: TextStyle(
                    color: Color(0xff595260),
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ),
              SizedBox(height: 4),
              Center(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(100),
                  child: Container(
                    color: Color(0xffb2b1b9),
                    width: Get.width * 0.9,
                    height: Get.height * 0.06,
                    child: TextFormField(
                      controller: controller.phoneController,
                      autofocus: true,
                      cursorColor: Colors.black,
                      cursorHeight: 28.0,
                      validator: (text) =>
                          text!.isEmpty ? 'Phone Number cannot be empty' : null,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        focusedBorder: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(100.0)),
                            borderSide:
                                BorderSide(color: Colors.black26, width: 3.0)),
                        contentPadding: EdgeInsets.symmetric(
                            vertical: -13.0, horizontal: 24.0),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 32),
              controller.showOtp.value?
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(8.0, 0, 0, 0),
                    child: Text(
                      'OTP',
                      style: TextStyle(
                        color: Color(0xff595260),
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ),
                  SizedBox(height: 4),
                  Center(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: Container(
                        color: Color(0xffb2b1b9),
                        width: Get.width * 0.9,
                        height: Get.height * 0.06,
                        child: TextFormField(
                          controller: controller.otpController,
                          autofocus: true,
                          cursorColor: Colors.black,
                          cursorHeight: 28.0,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            focusedBorder: OutlineInputBorder(
                                borderRadius:
                                BorderRadius.all(Radius.circular(100.0)),
                                borderSide:
                                BorderSide(color: Colors.black26, width: 3.0)),
                            contentPadding: EdgeInsets.symmetric(
                                vertical: -13.0, horizontal: 24.0),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ) : Text(''),
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(top: 40.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: SizedBox(
                      height: 64,
                      width: 350,
                      child: ElevatedButton(
                          onPressed: () {
                            if(controller.formKey_1.currentState!.validate()){
                              if(controller.showOtp.value){
                                controller.verifyOtp();
                              }else{
                                controller.sendOtp();
                              }
                            }
                          },
                          style: ElevatedButton.styleFrom(
                              primary: Color(0xffffd523), elevation: 10),
                          child: Text(
                            !controller.showOtp.value? 'Send Otp' : 'Sign-In',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 24,
                                fontWeight: FontWeight.bold),
                          )),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 4),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('New User',
                      style: TextStyle(
                          color: Color(0xff595260),
                          fontSize: 18,
                          )),
                  TextButton(
                    onPressed: () {
                      controller.screenNum.value = 3;
                    },
                    child: Text('Sign Up',
                        style: TextStyle(
                          color: Color(0xffffd523),
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        )),
                  ),
                ],
              ),
            ]),
      ));
}

Widget showSignUp(AuthController controller) {
  return SingleChildScrollView(
    child: Container(
        height: Get.height,
        width: Get.width,
        color: Color(0xff2c2e43),
        child: Form(
          key: controller.formKey_2,
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Text(
                    'Sign-Up',
                    style: TextStyle(
                      color: Color(0xffffd523),
                      fontSize: 48,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(height: 32),
                Padding(
                  padding: const EdgeInsets.fromLTRB(40.0, 0, 0, 0),
                  child: Text(
                    'Name',
                    style: TextStyle(
                      color: Color(0xff595260),
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ),
                SizedBox(height: 4),
                Center(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: Container(
                      color: Color(0xffb2b1b9),
                      width: Get.width * 0.9,
                      height: Get.height * 0.06,
                      child: TextFormField(
                        controller: controller.nameController,
                        autofocus: true,
                        cursorColor: Colors.black,
                        cursorHeight: 28.0,
                        validator: (text) =>
                            text!.isEmpty ? 'Name cannot be empty' : null,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          focusedBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(100.0)),
                              borderSide:
                                  BorderSide(color: Colors.black26, width: 3.0)),
                          contentPadding: EdgeInsets.symmetric(
                              vertical: -13.0, horizontal: 24.0),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 8),
                Padding(
                  padding: const EdgeInsets.fromLTRB(40.0, 0, 0, 0),
                  child: Text(
                    'Email',
                    style: TextStyle(
                      color: Color(0xff595260),
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ),
                SizedBox(height: 4),
                Center(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: Container(
                      color: Color(0xffb2b1b9),
                      width: Get.width * 0.9,
                      height: Get.height * 0.06,
                      child: TextFormField(
                        controller: controller.emailController,
                        autofocus: true,
                        cursorColor: Colors.black,
                        cursorHeight: 28.0,
                        validator: (text) =>
                            text!.isEmpty ? 'Email cannot be empty' : null,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          focusedBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(100.0)),
                              borderSide:
                                  BorderSide(color: Colors.black26, width: 3.0)),
                          contentPadding: EdgeInsets.symmetric(
                              vertical: -13.0, horizontal: 24.0),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 8),
                Padding(
                  padding: const EdgeInsets.fromLTRB(40.0, 0, 0, 0),
                  child: Text(
                    'Phone Number',
                    style: TextStyle(
                      color: Color(0xff595260),
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ),
                SizedBox(height: 4),
                Center(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: Container(
                      color: Color(0xffb2b1b9),
                      width: Get.width * 0.9,
                      height: Get.height * 0.06,
                      child: TextFormField(
                        controller: controller.phoneController,
                        autofocus: true,
                        cursorColor: Colors.black,
                        cursorHeight: 28.0,
                        validator: (text) =>
                            text!.isEmpty ? 'Phone Number cannot be empty' : null,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          focusedBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(100.0)),
                              borderSide:
                                  BorderSide(color: Colors.black26, width: 3.0)),
                          contentPadding: EdgeInsets.symmetric(
                              vertical: -13.0, horizontal: 24.0),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 8),
                controller.showOtp.value? Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(40.0, 0, 0, 0),
                      child: Text(
                        'OTP',
                        style: TextStyle(
                          color: Color(0xff595260),
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ),
                    SizedBox(height: 4),
                    Center(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        child: Container(
                          color: Color(0xffb2b1b8),
                          width: Get.width * 0.9,
                          height: Get.height * 0.06,
                          child: TextFormField(
                            controller: controller.otpController,
                            autofocus: true,
                            cursorColor: Colors.black,
                            cursorHeight: 28.0,
                            validator: (text) =>
                            text!.isEmpty ? 'OTP cannot be empty' : null,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              focusedBorder: OutlineInputBorder(
                                  borderRadius:
                                  BorderRadius.all(Radius.circular(100.0)),
                                  borderSide:
                                  BorderSide(color: Colors.black26, width: 3.0)),
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: -13.0, horizontal: 24.0),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ) : Text(''),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 40.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: SizedBox(
                        height: 64,
                        width: 350,
                        child: ElevatedButton(
                            onPressed: () async {
                              if(controller.formKey_2.currentState!.validate()){
                                if(controller.showOtp.value){
                                  await controller.verifyOtp();
                                  await controller.registerUser();
                                }else{
                                  controller.sendOtp();
                                }
                              }
                            },
                            style: ElevatedButton.styleFrom(
                                primary: Color(0xffffd523), elevation: 10),
                            child: Text(
                              !controller.showOtp.value? 'Send Otp' : 'Sign-Up',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold),
                            )),
                      ),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Already have an account',
                        style: TextStyle(
                            color: Color(0xff595260),
                            fontSize: 18,
                          )),
                    TextButton(
                      onPressed: () {
                        controller.screenNum.value = 2;
                      },
                      child: Text('Sign In',
                          style: TextStyle(
                            color: Color(0xffffd523),
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          )),
                    ),
                  ],
                ),
              ]),
        )),
  );
}
