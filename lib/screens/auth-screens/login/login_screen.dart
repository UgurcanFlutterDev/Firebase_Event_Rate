import 'package:eventrate/features/auth-features/login/controller/login_controller.dart';
import 'package:eventrate/screens/auth-screens/register/register_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final LoginController loginController = Get.put(LoginController());

    return Scaffold(
      appBar: AppBar(
        title: Text("login".tr),
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            TextFormField(
              controller: loginController.emailEditingController.value,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                label: Text(
                  "email".tr,
                ),
              ),
            ),
            SizedBox(height: Get.height * .02),
            TextFormField(
              controller: loginController.passwordEditingController.value,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                label: Text(
                  "password".tr,
                ),
              ),
            ),
            SizedBox(height: Get.height * .02),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    loginController.login();
                  },
                  child: Text(
                    "login".tr,
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    Get.to(() => RegisterScreen());
                  },
                  child: Text(
                    "register".tr,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
