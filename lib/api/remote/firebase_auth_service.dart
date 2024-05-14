import 'package:firebase_auth/firebase_auth.dart';
import 'package:crosspay/screens/authentication/enter_phone_number_screen/logic.dart';
import 'package:crosspay/screens/authentication/verify_o_t_p_screen/logic.dart';
import 'package:get/get.dart';

class FirebaseAuthService {
  FirebaseAuthService() {}

  FirebaseAuth auth = FirebaseAuth.instance;
  var enterNumberController = Get.put(EnterPhoneNumberScreenLogic());
  var verifyOTPController = Get.put(VerifyOTPScreenLogic());

  void getVerificationCode(
      String phoneNumber, int? fResendingToken, bool resending) async {
    try {
      await auth.verifyPhoneNumber(
          phoneNumber: phoneNumber,
          timeout: Duration(seconds: 60),
          verificationCompleted: (PhoneAuthCredential credential) {
            enterNumberController.verificationCompleted(credential);
          },
          verificationFailed: (FirebaseAuthException e) {
            verifyOTPController.stopLoading();
            enterNumberController.verificationFailed(e);
          },
          codeSent: (String verificationId, int? forceResendingToken) {
            if (resending) {
              verifyOTPController.showSuccessMessage('Verification code sent');
              verifyOTPController.setResendOtpToken(
                  verificationId!, forceResendingToken);
            } else {
              enterNumberController.verificationCodeSent(
                  verificationId, forceResendingToken);
            }
          },
          codeAutoRetrievalTimeout: (String? verificationId) {},
          forceResendingToken: fResendingToken);
    } catch (e) {
      enterNumberController
          .showErrorMessage('An error occurred. Please try again');
      print(e);
    }
  }

  void verifyOTPCode(String otp, String verificationId) {
    PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: verificationId, smsCode: otp);
    signIn(credential, true);
  }

  void signIn(PhoneAuthCredential credential, bool isVerifyOTP) async {
    try {
      UserCredential userCredential =
          await auth.signInWithCredential(credential);
      if (userCredential.user != null) {
        checkExistingUser(userCredential.user!.uid);
      } else {
        if (isVerifyOTP) {
          verifyOTPController.stopLoading();
          enterNumberController
              .showErrorMessage('Failed to verify OTP. Please try again');
        } else {
          enterNumberController
              .showErrorMessage('Verification failed. Please try again');
        }
      }
    } on FirebaseAuthException catch (e) {
      if (isVerifyOTP) verifyOTPController.stopLoading();
      enterNumberController.showErrorMessage(e.code);
    } catch (e) {
      print(e);
    }
  }

  void checkExistingUser(String userId) async {
    enterNumberController.stopLoading();
    await verifyOTPController.checkExistingUser(userId);
  }
}
