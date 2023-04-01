import 'package:firebase_demo_1/auth_controller.dart';
import 'package:firebase_demo_1/pages/signup_page.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    double wSize = MediaQuery.of(context).size.width;
    double hSize = MediaQuery.of(context).size.height;
    var emailController = TextEditingController();
    var passwordController = TextEditingController();

    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Container(
            width: wSize,
            height: hSize * 0.3,
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/img/loginimg.png'),
                  fit: BoxFit.cover),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Container(
              alignment: Alignment.centerLeft,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children:  [
                  const Text(
                    'Hello',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 70,
                        fontWeight: FontWeight.bold),
                  ),
                  const Text(
                    'Sign into your account',
                    style: TextStyle(fontSize: 20, color: Colors.grey),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.2),
                          offset: const Offset(1, 1),
                          blurRadius: 10,
                          spreadRadius: 7
                        )
                      ]
                    ),
                    child: TextField(
                      controller: emailController,
                      decoration: InputDecoration(
                        label: const Text('email'),
                        icon: const Padding(
                      padding: EdgeInsets.only(left: 8.0),
                      child: Icon(Icons.email_rounded),
                    ),
                    iconColor: Colors.orange[700],
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: const  BorderSide(
                              color: Colors.white
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: const BorderSide(
                              color: Colors.white
                          ),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(30),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.grey.withOpacity(0.2),
                              offset: const Offset(1, 1),
                              blurRadius: 10,
                            spreadRadius: 7
                          )
                        ]
                    ),
                    child: TextField(
                      controller: passwordController,
                      decoration: InputDecoration(
                        label: const Text('password'),

                        icon: const Padding(
                          padding: EdgeInsets.only(left: 8.0),
                          child: Icon(Icons.password_rounded),
                        ),
                        iconColor: Colors.orange[700],
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: const BorderSide(
                              color: Colors.white
                          ),
                        ),
                        focusedBorder:  OutlineInputBorder(

                          borderRadius: BorderRadius.circular(30),
                          borderSide: const BorderSide(
                              color: Colors.white
                          ),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                      height: 20,
                  ),
                  const Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      'Sign into your account',
                      style: TextStyle(fontSize: 20, color: Colors.grey),
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: GestureDetector(
                      onTap: ()=> AuthController.instance.login(
                          emailController.text, passwordController.text),
                      child: Container(
                        alignment: Alignment.center,
                        width: wSize * 0.5,
                        height: hSize *0.08,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),

                            image: const DecorationImage(
                              fit: BoxFit.cover,
                                image: AssetImage('assets/img/loginbtn.png')
                            )
                        ),
                          child: const Text('Login', style: TextStyle(
                              color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold
                          ),),
                      ),
                    ),
                  ),

                  SizedBox(height: wSize*0.08,),
                  Align(
                    alignment: Alignment.center,
                    child: RichText(text: TextSpan(
                      text: 'Don\'t have an account?',
                      style: TextStyle(
                        color: Colors.grey[500],
                        fontSize: 20,

                      ),
                         children:  [
                        TextSpan(
                        text: ' Create',
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                        ),
                          recognizer: TapGestureRecognizer()..onTap=
                              ()=> Get.to(()=> const SignUpPage())
                        )
                         ]
                    ),
                    ),
                  ),

                ],

              ),
            ),
          ),

        ],
      ),
    );
  }
}
