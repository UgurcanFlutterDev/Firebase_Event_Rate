import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterController extends GetxController {
  Rx<TextEditingController> emailEditingController = Rx<TextEditingController>(TextEditingController());
  Rx<TextEditingController> passwordEditingController = Rx<TextEditingController>(TextEditingController());
  Rx<TextEditingController> nameEditingController = Rx<TextEditingController>(TextEditingController());
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  Future<void> register(BuildContext context) async {
    try {
      final UserCredential cred = await _auth.createUserWithEmailAndPassword(
        email: emailEditingController.value.text,
        password: passwordEditingController.value.text,
      );
      await _firestore.collection("user").doc(cred.user!.uid).set({
        "fullName": nameEditingController.value.text,
        "email": emailEditingController.value.text,
      });
      Navigator.pop(context);
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
}
