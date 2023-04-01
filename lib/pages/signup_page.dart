

import 'package:firebase_demo_1/auth_controller.dart';
import 'package:firebase_demo_1/pages/login_page.dart';
import 'package:firebase_demo_1/pages/welcome_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    double wSize = MediaQuery.of(context).size.width;
    double hSize = MediaQuery.of(context).size.height;

    List images = [
      'g.png',
      'f.png',
      't.png'
    ];
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Container(
            width: wSize,
            height: hSize * 0.3,
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/img/signup.png'),
                  fit: BoxFit.cover),
            ),
            child: Column(
              children: [
                SizedBox(
                  height: hSize * 0.16,
                ),
                const CircleAvatar(
                  backgroundColor: Colors.white70,
                  backgroundImage: AssetImage('assets/img/profile1.png'),
                  radius: 50,
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Container(
              alignment: Alignment.centerLeft,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children:  [
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

                  const SizedBox(
                    height: 40,
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: GestureDetector(
                      onTap: ()=> AuthController.instance.register(
                          emailController.text.trim(), passwordController.text.trim()),
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
                        child: TextButton(
                          onPressed:() {},
                          child: const Text('Sign Up', style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold
                          ),),),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: RichText(text: TextSpan(
                        recognizer: TapGestureRecognizer()..onTap=()=>Get.to(()=>LoginPage()),
                        text: 'have an account?',
                        style: TextStyle(
                          color: Colors.grey[500],
                          fontSize: 18,

                        )
                    ),
                    ),
                  ),
                  SizedBox(height: wSize*0.08,),
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                        'Sign up using one of the following',
                        style: TextStyle(
                          color: Colors.grey[500],
                          fontSize: 20,

                        ),

                    ),

                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Center(
                    child: Wrap(
                      children: List<Widget>.generate(
                        3, (index){
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: CircleAvatar(
                              radius: 25,
                              backgroundColor: Colors.grey[700],
                              child: CircleAvatar(
                                radius: 23,
                                backgroundImage: AssetImage('assets/img/'+images[index]),
                              ),
                            ),
                          );
                      }
                      ),
                    ),
                  )

                ],

              ),
            ),
          ),

        ],
      ),
    );
  }
}

