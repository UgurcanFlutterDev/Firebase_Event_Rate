import 'dart:convert';
import 'dart:developer';

import 'package:eventrate/features/auth-features/login/model/user_model.dart' as u;
import 'package:eventrate/utils/utils.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';

class LoginController extends GetxController {
  Rx<TextEditingController> emailEditingController = Rx<TextEditingController>(TextEditingController());
  Rx<TextEditingController> passwordEditingController = Rx<TextEditingController>(TextEditingController());

  Future<void> login() async {
    try {
      UserCredential cred = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailEditingController.value.text.trim(),
        password: passwordEditingController.value.text.trim(),
      );
      final u.User user = Utils.convertFirebaseUserToUserModel(cred.user!);
      var box = Hive.box("userBox");
      box.put("user", user.toJson());
    } on FirebaseAuthException catch (e) {
      Get.showSnackbar(
        GetSnackBar(
          snackPosition: SnackPosition.BOTTOM,
          duration: Duration(seconds: 3),
          messageText: Text(
            e.message ?? "",
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      );
    }
  }

  Future<void> logout() async {
    await FirebaseAuth.instance.signOut();
  }
}
