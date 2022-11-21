import 'package:eventrate/features/auth-features/register/controller/register_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final RegisterController registerController = Get.put(RegisterController());

    return Scaffold(
      appBar: AppBar(
        title: Text("register".tr),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            TextFormField(
              controller: registerController.nameEditingController.value,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                label: Text(
                  "fullName".tr,
                ),
              ),
            ),
            SizedBox(height: Get.height * .02),
            TextFormField(
              controller: registerController.emailEditingController.value,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                label: Text(
                  "email".tr,
                ),
              ),
            ),
            SizedBox(height: Get.height * .02),
            TextFormField(
              controller: registerController.passwordEditingController.value,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                label: Text(
                  "password".tr,
                ),
              ),
            ),
            SizedBox(height: Get.height * .02),
            ElevatedButton(
              onPressed: () {
                registerController.register(context);
              },
              child: Text(
                "register".tr,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
