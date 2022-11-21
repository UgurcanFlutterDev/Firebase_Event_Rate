import 'package:eventrate/screens/app-screens/app_main.dart';
import 'package:eventrate/screens/app-screens/events/event-list/home_screen.dart';
import 'package:eventrate/screens/auth-screens/login/login_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: ((context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Text("Loading...");
          }
          if (snapshot.hasData) {
            return AppMainScreen();
          }

          return LoginScreen();
        }),
      ),
    );
  }
}
