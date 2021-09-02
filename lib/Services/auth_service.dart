import 'dart:developer';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';


final auth = FirebaseAuth.instance;

class AuthService {
  late String _verificationID;
  late ConfirmationResult confirmationResult;

  Stream<User?> currentUserStream = auth.userChanges();
  User? currentUser = auth.currentUser;

  /// [Login with email and password]
  Future<String> signInWithEmail(String email, String pass,
      [bool admin = false]) async {
    assert(email.isNotEmpty && pass.isNotEmpty);
    print('$email, $pass');
    String msg = '';
    try {
      await auth.signInWithEmailAndPassword(email: email, password: pass);
    } on FirebaseAuthException catch (e) {
      log('$e');
      Get.rawSnackbar(title: 'Something Went Wrong!', message: '${e.code}');
    }
    return msg;
  }

  /// [Request OTP from user]
  Future<void> requestOtpUsingPhoneNumber(String phone) async {
    void Function(String, int?) codeSent =
        (String verificationId, int? forceResendingToken) async {
      _verificationID = verificationId;

      print('force resending token ' + forceResendingToken.toString());
    };
    PhoneCodeAutoRetrievalTimeout codeAutoRetrievalTimeout =
        (String verificationId) {
      _verificationID = verificationId;
      print('PhoneCodeAutoRetrievalTimeout');
    };
    PhoneVerificationCompleted verificationCompleted =
        (AuthCredential phoneAuthCredential) async {
    };
    PhoneVerificationFailed verificationFailed =
        (FirebaseAuthException authException) {
      print(
          'Phone number verification failed. Code: ${authException.code}. Message: ${authException.message}');
    };
    try {
      if (GetPlatform.isWeb) {
        confirmationResult = await auth.signInWithPhoneNumber(phone);
        print(confirmationResult);
        return;
      }
      await auth.verifyPhoneNumber(
          phoneNumber: phone,
          timeout: Duration(seconds: 120),
          verificationCompleted: verificationCompleted,
          verificationFailed: verificationFailed,
          codeSent: codeSent,
          codeAutoRetrievalTimeout: codeAutoRetrievalTimeout);
    } catch (e) {
      log('Error: $e');
      Get.rawSnackbar(
          title: 'Error', message: '$e', duration: Duration(seconds: 5));
    }
  }

  /// [Sign in completion using otp]
  Future<User?> signInWithOtp(String smsCode) async {
    User? user;
    try {
      if (GetPlatform.isWeb) {
        UserCredential userCredential =
        await confirmationResult.confirm(smsCode);
        print(userCredential);

        return userCredential.user;
      }
      AuthCredential authCred;
      authCred = PhoneAuthProvider.credential(
          verificationId: _verificationID, smsCode: smsCode);
      user = (await FirebaseAuth.instance.signInWithCredential(authCred)).user!;

      print('User After Sign in With OTP: $user');
      return user;
    } catch (e) {
      Get.rawSnackbar(
          title: 'Error', message: '$e', duration: Duration(seconds: 5));
    }
  }

  /// [Sign Out a User]
  Future<void> logout() async {
    await auth.signOut();
  }
}
