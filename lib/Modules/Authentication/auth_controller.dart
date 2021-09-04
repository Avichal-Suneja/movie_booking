import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:movie_booking/Services/auth_service.dart';
import 'package:movie_booking/Services/database_service.dart';

class AuthController extends GetxController{

  DatabaseService _db = DatabaseService();
  AuthService _auth = AuthService();

  TextEditingController nameController = new TextEditingController();
  TextEditingController emailController = new TextEditingController();
  TextEditingController phoneController = new TextEditingController();
  TextEditingController otpController = new TextEditingController();

  String uid = '';

  sendOtp() async {
    await _auth.requestOtpUsingPhoneNumber(phoneController.text);
  }

  verifyOtp() async {
    uid = (await _auth.signInWithOtp(otpController.text))!;
  }

  registerUser() async {
    await _db.upsert('Customers/$uid', {
      'Uid' : uid,
      'Name' : nameController.text,
      'Email' : emailController.text,
      'Phone' : phoneController.text,
      'Bookings' : {}
    });
  }


}