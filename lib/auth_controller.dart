
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_demo_1/pages/login_page.dart';
import 'package:firebase_demo_1/pages/welcome_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthController extends GetxController{
  //Auth Controller instance
  static AuthController instance = Get.find();
  //user model
  late Rx<User?> _user;

  FirebaseAuth auth = FirebaseAuth.instance;

  @override
  void onReady() {
    super.onReady();
    _user = Rx<User?>(auth.currentUser);
    //this help to notify the user instance
    _user.bindStream(auth.userChanges());
    // a listener that help monitor the use changes
    ever(_user, _initialScreen);
  }

  _initialScreen(User? user){
    if(user == null){
      print('no user goto login page');
      Get.offAll(()=> const LoginPage());
    }else{
      Get.offAll(()=> const WelcomePage());
    }
  }

  void register(String email, password) async{

    try {
     await auth.createUserWithEmailAndPassword(email: email, password: password);
    }catch(e) {
      print('error =====${e.obs}');
      Get.snackbar("About User", "User message",
      backgroundColor: Colors.redAccent,
      snackPosition: SnackPosition.BOTTOM,
        titleText: const Text('Account creation failed',
        style: TextStyle(
          color: Colors.white
        ),
        ),
          messageText: Text(
          e.toString(),
            style: const TextStyle(
              color: Colors.white
            ),
      )
      );
    }
    }
  void login(String email, password) async{
    try {
      await auth.signInWithEmailAndPassword(email: email, password: password);
    }catch(e) {
      print('error =====${e.obs}');
      Get.snackbar("About Login", "Login message",
          backgroundColor: Colors.redAccent,
          snackPosition: SnackPosition.BOTTOM,
          titleText: const Text('Account creation failed',
            style: TextStyle(
                color: Colors.white
            ),
          ),
          messageText: Text(
            e.toString(),
            style: const TextStyle(
                color: Colors.white
            ),
          )
      );
    }
  }
  void logOut() async{
   await auth.signOut();
  }
  }
