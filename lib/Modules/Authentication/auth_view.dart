import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'auth_controller.dart';


class AuthView extends StatelessWidget {
  const AuthView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: showSignUp()
    );
  }

}

Widget showWelcomePage() {
  return Container(
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
  );
}

Widget showSignIn() {
  return Container(
    height: Get.height,
    width: Get.width,
    color: Color(0xff303438),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
      Center(
        child: Text('Sign-In', style: TextStyle(
        color: Color(0xffEFAE28),
        fontSize: 48,
        fontWeight: FontWeight.bold,
    ),),
      ),
        SizedBox(height: 32),
        Padding(
          padding: const EdgeInsets.fromLTRB(40.0,0,0,0),
          child: Text(
            'Phone Number',
            style: TextStyle(
              color: Color(0xff666a6e),
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
              color: Color(0xff9c9c9c),
              width: Get.width * 0.9,
              height: Get.height * 0.07,
              child: TextFormField(
                autofocus: true,
                cursorColor: Colors.black,
                cursorHeight: 28.0,
                validator: (text) => text!.isEmpty? 'Phone Number cannot be empty' : null,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(100.0)),
                      borderSide:
                      BorderSide(color: Colors.black26, width: 3.0)),
                      contentPadding:
                      EdgeInsets.symmetric(vertical: -13.0, horizontal: 24.0),
                ),
              ),
            ),
          ),
        ),
        SizedBox(height: 32),
        Padding(
          padding: const EdgeInsets.fromLTRB(40.0,0,0,0),
          child: Text(
            'OTP',
            style: TextStyle(
              color: Color(0xff666a6e),
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
              color: Color(0xff9c9c9c),
              width: Get.width * 0.9,
              height: Get.height * 0.07,
              child: TextFormField(
                autofocus: true,
                cursorColor: Colors.black,
                cursorHeight: 28.0,
                validator: (text) => text!.isEmpty? 'Phone Number cannot be empty' : null,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(100.0)),
                      borderSide:
                      BorderSide(color: Colors.black26, width: 3.0)),
                  contentPadding:
                  EdgeInsets.symmetric(vertical: -13.0, horizontal: 24.0),
                ),
              ),
            ),
          ),
        ),
        Center(
          child: Padding(
            padding: const EdgeInsets.only(top: 40.0),
            child: ClipRRect(
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
                    child: Text('Sign-In',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 24,
                          fontWeight: FontWeight.bold
                      ),)
                ),
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
                  color: Color(0xff666a6e),
                  fontSize: 18,
                  fontWeight: FontWeight.bold
                )),
            TextButton(
              onPressed: () {},
              child: Text('Sign Up',
                  style: TextStyle(
                    color: Color(0xffEFAE28),
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  )),
            ),
          ],
        ),
    ]
  )
  );
}

Widget showSignUp() {
  return Container(
    height: Get.height,
    width: Get.width,
    color: Color(0xff303438),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
    Center(
    child: Text('Sign-Up', style: TextStyle(
      color: Color(0xffEFAE28),
      fontSize: 48,
      fontWeight: FontWeight.bold,
    ),),
  ),
      SizedBox(height: 32),
      Padding(
        padding: const EdgeInsets.fromLTRB(40.0,0,0,0),
        child: Text(
          'Name',
          style: TextStyle(
            color: Color(0xff666a6e),
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),),
      SizedBox(height: 4),
      Center(
        child: ClipRRect(
          borderRadius: BorderRadius.circular(100),
          child: Container(
            color: Color(0xff9c9c9c),
            width: Get.width * 0.9,
            height: Get.height * 0.07,
            child: TextFormField(
              autofocus: true,
              cursorColor: Colors.black,
              cursorHeight: 28.0,
              validator: (text) => text!.isEmpty? 'Name cannot be empty' : null,
              decoration: InputDecoration(
                border: InputBorder.none,
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(100.0)),
                  borderSide:
                  BorderSide(color: Colors.black26, width: 3.0)),
                  contentPadding:
                  EdgeInsets.symmetric(vertical: -13.0, horizontal: 24.0),
                ),
              ),
          ),
        ),
      ),
        SizedBox(height: 8),
        Padding(
          padding: const EdgeInsets.fromLTRB(40.0,0,0,0),
          child: Text(
            'Email',
            style: TextStyle(
              color: Color(0xff666a6e),
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),),
        SizedBox(height: 4),
        Center(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(100),
            child: Container(
              color: Color(0xff9c9c9c),
              width: Get.width * 0.9,
              height: Get.height * 0.07,
              child: TextFormField(
                autofocus: true,
                cursorColor: Colors.black,
                cursorHeight: 28.0,
                validator: (text) => text!.isEmpty? 'Email cannot be empty' : null,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(100.0)),
                      borderSide:
                      BorderSide(color: Colors.black26, width: 3.0)),
                  contentPadding:
                  EdgeInsets.symmetric(vertical: -13.0, horizontal: 24.0),
                ),
              ),
            ),
          ),
        ),
        SizedBox(height: 8),
        Padding(
          padding: const EdgeInsets.fromLTRB(40.0,0,0,0),
          child: Text(
            'Phone Number',
            style: TextStyle(
              color: Color(0xff666a6e),
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),),
        SizedBox(height: 4),
        Center(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(100),
            child: Container(
              color: Color(0xff9c9c9c),
              width: Get.width * 0.9,
              height: Get.height * 0.07,
              child: TextFormField(
                autofocus: true,
                cursorColor: Colors.black,
                cursorHeight: 28.0,
                validator: (text) => text!.isEmpty? 'Phone Number cannot be empty' : null,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(100.0)),
                      borderSide:
                      BorderSide(color: Colors.black26, width: 3.0)),
                  contentPadding:
                  EdgeInsets.symmetric(vertical: -13.0, horizontal: 24.0),
                ),
              ),
            ),
          ),
        ),
        SizedBox(height: 8),
        Padding(
          padding: const EdgeInsets.fromLTRB(40.0,0,0,0),
          child: Text(
            'OTP',
            style: TextStyle(
              color: Color(0xff666a6e),
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),),
        SizedBox(height: 4),
        Center(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(100),
            child: Container(
              color: Color(0xff9c9c9c),
              width: Get.width * 0.9,
              height: Get.height * 0.07,
              child: TextFormField(
                autofocus: true,
                cursorColor: Colors.black,
                cursorHeight: 28.0,
                validator: (text) => text!.isEmpty? 'Name cannot be empty' : null,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(100.0)),
                      borderSide:
                      BorderSide(color: Colors.black26, width: 3.0)),
                  contentPadding:
                  EdgeInsets.symmetric(vertical: -13.0, horizontal: 24.0),
                ),
              ),
            ),
          ),
        ),
        Center(
          child: Padding(
            padding: const EdgeInsets.only(top: 40.0),
            child: ClipRRect(
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
                    child: Text('Sign-In',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 24,
                          fontWeight: FontWeight.bold
                      ),)
                ),
              ),
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Already have an account',
                style: TextStyle(
                  color:  Color(0xff666a6e),
                  fontSize: 18,
                  fontWeight: FontWeight.bold
                )),
            TextButton(
              onPressed: () {},
              child: Text('Sign In',
                  style: TextStyle(
                    color: Color(0xffEFAE28),
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  )),
            ),
          ],
        ),
    ]
    )
  );
}