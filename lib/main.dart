import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_demo_1/auth_controller.dart';
import 'package:firebase_demo_1/pages/login_page.dart';
import 'package:firebase_demo_1/pages/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  //this is used to bind the app with firebase
  await Firebase.initializeApp().then((value) => Get.put(AuthController()));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(),
      home: const SplashScreen(),
    );
  }
}