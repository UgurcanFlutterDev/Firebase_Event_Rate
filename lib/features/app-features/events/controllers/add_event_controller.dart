import 'dart:developer';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eventrate/features/app-features/events/models/events/add-event/add_event_request_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';

class AddEventController extends GetxController {
  RxString text = RxString("a");

  Rx<AddEventRequestModel> addEventRequestModel = Rx<AddEventRequestModel>(AddEventRequestModel());
  Rxn<File> addEventRequestModelFile = Rxn<File>();

  RxBool formHasError = RxBool(false);

  RxBool isButtonLoading = RxBool(false);

  Rx<GlobalKey<FormState>> formKey = Rx<GlobalKey<FormState>>(GlobalKey<FormState>());

  // Rx<TextEditingController>

  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  final FirebaseAuth auth = FirebaseAuth.instance;

  Future<String> uploadPhoto() async {
    if (addEventRequestModelFile.value != null) {
      final fileName = (addEventRequestModelFile.value!.path);

      try {
        final ref = FirebaseStorage.instance.ref(fileName).child('eventPhotos/');
        UploadTask uploadTask = ref.putFile(addEventRequestModelFile.value!);

        final downloadURL = await (await uploadTask).ref.getDownloadURL();
        return downloadURL;
      } catch (e) {
        print('error occured');
      }
    }
    return "";
  }

  Future<void> addEvent() async {
    isButtonLoading.value = true;
    if (!formKey.value.currentState!.validate()) {
      formHasError.value = true;
      isButtonLoading.value = false;

      return;
    }
    formKey.value.currentState!.save();
    final photoUrl = await uploadPhoto();
    Box box = Hive.box("userBox");
    addEventRequestModel.value.createdDate = DateTime.now().toLocal().toIso8601String();

    await firestore.collection("events").doc().set({
      "user": box.get("user"),
      ...addEventRequestModel.toJson(),
      "imageUrl": photoUrl,
    });

    isButtonLoading.value = false;
    Get.close(1);

    // // Get docs from collection reference
    // QuerySnapshot querySnapshot = await firestore.collection("user").get();

    // // Get data from docs and convert map to List
    // final allData = querySnapshot.docs.map((doc) => doc.data()).toList();
    // inspect(allData);
  }
}
