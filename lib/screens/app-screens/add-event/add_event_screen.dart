import 'dart:developer';
import 'dart:io';

import 'package:eventrate/config/validators.dart';
import 'package:eventrate/features/app-features/events/controllers/add_event_controller.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class AddEventScreen extends StatelessWidget {
  const AddEventScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final AddEventController eventController = Get.put(AddEventController());
    final ImagePicker _picker = ImagePicker();

    return Scaffold(
      appBar: AppBar(
        title: Text("addEventTitle".tr),
      ),
      bottomNavigationBar: Container(
        height: 60,
        child: ElevatedButton(
          child: Text("add".tr),
          onPressed: () {
            eventController.addEvent();
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: GetX<AddEventController>(
            init: AddEventController(),
            initState: (_) {},
            builder: (controller) {
              return Form(
                autovalidateMode: controller.formHasError.value ? AutovalidateMode.always : AutovalidateMode.disabled,
                key: controller.formKey.value,
                child: Column(
                  children: [
                    ElevatedButton(
                        onPressed: () async {
                          final XFile? file = await _picker.pickImage(source: ImageSource.gallery);
                          if (file != null) {
                            final File photo = File(file.path);
                            controller.addEventRequestModelFile.value = photo;
                          }
                        },
                        child: Text("Foto Ekle")),
                    TextFormField(
                      // controller: loginController.emailEditingController.value,
                      validator: Validators.isEmpty,
                      onSaved: (val) {
                        controller.addEventRequestModel.value.title = val;
                      },
                      decoration: InputDecoration(
                        border: const OutlineInputBorder(),
                        label: Text("title".tr),
                      ),
                    ),
                    SizedBox(height: Get.height * .02),
                    TextFormField(
                      // controller: loginController.emailEditingController.value,
                      validator: Validators.isEmpty,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        label: Text("subTitle".tr),
                      ),
                      onSaved: (val) {
                        controller.addEventRequestModel.value.subTitle = val;
                      },
                    ),
                    SizedBox(height: Get.height * .02),
                    TextFormField(
                      // controller: loginController.emailEditingController.value,
                      validator: Validators.isEmpty,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        label: Text("creator".tr),
                      ),
                      onSaved: (val) {
                        controller.addEventRequestModel.value.creator = val;
                      },
                    ),
                    SizedBox(height: Get.height * .02),
                    Row(
                      children: [
                        Expanded(
                          child: TextFormField(
                            validator: Validators.isEmpty,
                            // controller: loginController.emailEditingController.value,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              label: Text("startDate".tr),
                            ),
                            onSaved: (val) {
                              controller.addEventRequestModel.value.startDate = val;
                            },
                          ),
                        ),
                        const SizedBox(width: 20),
                        Expanded(
                          child: TextFormField(
                            validator: Validators.isEmpty,
                            // controller: loginController.emailEditingController.value,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              label: Text("startTime".tr),
                            ),
                            onSaved: (val) {
                              controller.addEventRequestModel.value.startTime = val;
                            },
                          ),
                        ),
                        SizedBox(height: Get.height * .02),
                      ],
                    ),
                    SizedBox(height: Get.height * .02),
                    Row(
                      children: [
                        Expanded(
                          child: TextFormField(
                            validator: Validators.isEmpty,
                            // controller: loginController.emailEditingController.value,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              label: Text("endDate".tr),
                            ),
                            onSaved: (val) {
                              controller.addEventRequestModel.value.endDate = val;
                            },
                          ),
                        ),
                        const SizedBox(width: 20),
                        Expanded(
                          child: TextFormField(
                            validator: Validators.isEmpty,
                            // controller: loginController.emailEditingController.value,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              label: Text("endTime".tr),
                            ),
                            onSaved: (val) {
                              controller.addEventRequestModel.value.endTime = val;
                            },
                          ),
                        ),
                        SizedBox(height: Get.height * .02),
                      ],
                    ),
                    SizedBox(height: Get.height * .02),
                    TextFormField(
                      // controller: loginController.emailEditingController.value,
                      validator: Validators.isEmpty,
                      minLines: 2,
                      maxLines: 5,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        label: Text("description".tr),
                      ),
                      onSaved: (val) {
                        controller.addEventRequestModel.value.creator = val;
                      },
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
