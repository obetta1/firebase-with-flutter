import 'package:firebase_demo_1/auth_controller.dart';
import 'package:flutter/material.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({Key? key}) : super(key: key);

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

                  ),
                  const SizedBox(
                    height: 20,
                  ),

                  const SizedBox(
                    height: 20,
                  ),
                   Column(
                    children: const [
                      Text(
                        'Welcome',
                        style: TextStyle(fontSize: 36, color: Colors.grey, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'ben@gmail.com',
                        style: TextStyle(fontSize: 18, color: Colors.grey),
                      ),
                    ],

                  ),
                  const SizedBox(
                    height: 200,
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: GestureDetector(
                      onTap: ()=> AuthController.instance.logOut(),
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
                          child: const Text('Sign Up', style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold
                          ),),
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
