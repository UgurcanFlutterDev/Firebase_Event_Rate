import 'package:eventrate/config/translations.dart';
import 'package:eventrate/features/auth-features/login/model/user_model.dart';
import 'package:eventrate/firebase_options.dart';
import 'package:eventrate/screens/auth-screens/login/login_screen.dart';
import 'package:eventrate/screens/main.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await Hive.initFlutter();
  await Hive.initFlutter();
  Hive.registerAdapter(UserAdapter());
  await Hive.openBox("userBox");

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      translations: Messages(),
      locale: Get.deviceLocale,
      debugShowCheckedModeBanner: false,
      fallbackLocale: const Locale('en', 'US'),
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MainScreen(),
    );
  }
}
