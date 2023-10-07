import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

FirebaseAuth auth = FirebaseAuth.instance;

class AuthController {
  static signInUser(String email, String password) async {
    auth
        .signInWithEmailAndPassword(email: email, password: password)
        .then((value) {
      debugPrint("Loading");
    }).onError((error, stackTrace) {
      debugPrint("An error occured");
    });
  }

  static signUpUser(
      String name, String email, String password, BuildContext context) async {
    auth
        .createUserWithEmailAndPassword(email: email, password: password)
        .then((value) {
      debugPrint("Loading");
    }).onError((error, stackTrace) {
      debugPrint("An error occured");
    });
  }
}
