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

  RxInt screenNum = 1.obs;
  RxBool showOtp = false.obs;

  String uid = '';
  final formKey_1 = GlobalKey<FormState>();
  final formKey_2 = GlobalKey<FormState>();

  sendOtp() async {
    await _auth.requestOtpUsingPhoneNumber('+91' + phoneController.text);
    showOtp.toggle();
  }

  verifyOtp() async {
    uid = (await _auth.signInWithOtp(otpController.text))!;
    Get.offAllNamed('/movie');
  }

  registerUser() async {
    await _db.upsert('Customers/$uid', {
      'uid' : uid,
      'name' : nameController.text,
      'email' : emailController.text,
      'phone' : phoneController.text,
    });
  }


}