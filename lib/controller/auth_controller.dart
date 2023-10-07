import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:personalmeetingschedulingplatform/utils/flutter_toast_message.dart';
import 'package:personalmeetingschedulingplatform/utils/reuseable_dialog_box.dart';

FirebaseAuth auth = FirebaseAuth.instance;

class AuthController {
  static signInUser(String email, String password, BuildContext context) async {
    ReusableDiaglogBox.dialgoBox(context);
    auth
        .signInWithEmailAndPassword(email: email, password: password)
        .then((value) {})
        .onError(
      (error, stackTrace) {
        ReusableDiaglogBox.hideLoadingDialogBox(context);
        if (error is FirebaseAuthException) {
          ToastMessage.showToastMessage(error.code.toString());
        } else {
          ToastMessage.showToastMessage("An unknown error occured");
        }
      },
    );
  }

  static sendResetLink(String email, BuildContext context) async {
    await auth.sendPasswordResetEmail(email: email).then((value) {
      ToastMessage.showToastMessage("Check email for reset link");
    }).onError((error, stackTrace) {
      ToastMessage.showToastMessage("An error occured");
    });
  }
}
