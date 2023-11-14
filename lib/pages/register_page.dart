import 'package:flutter/material.dart';

import '../components/my_button.dart';
import '../components/my_text_field.dart';

class RegisterPage extends StatefulWidget {
  final void Function()? onTap;
  const RegisterPage({super.key, required this.onTap});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {

  final emailController=TextEditingController();
  final passwordController=TextEditingController();
  final confirmPasswordController=TextEditingController();


  //-------signUp user------------------------
  void signUp(){

  }

  @override
  Widget build(BuildContext context) {
    return   Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                //------- logo--------------------
                const SizedBox(height: 50,),
                const   Icon(
                  Icons.message,
                  size: 100,
                  color: Colors.green,
                ),
                const SizedBox(height: 50,),
                //----------------create account message----------------
                const Text("Let's Create a new Account for you ! ",
                  style:TextStyle(
                    fontSize: 16,

                  ) ,
                ),
                const SizedBox(height: 25,),
                //----------------email text field----------------

                MyTextField(
                    controller: emailController,
                    hintText: "Enter your email",
                    obscureText: false),
                const SizedBox(height: 10,),
                //----------------password text field----------------
                MyTextField(
                    controller: passwordController,
                    hintText: "Enter your password",
                    obscureText: true
                ),
                const SizedBox(height: 10,),
                //----------------password text field----------------
                MyTextField(
                    controller: confirmPasswordController,
                    hintText: "Enter your confirm password",
                    obscureText: true
                ),
                const SizedBox(height: 25,),
                //----------------signup button----------------
                MyButton(onTap: () => signUp, text: "Sign up",),
                const SizedBox(height: 50,),
                 Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Already a member?"),
                    const SizedBox(width: 4,),
                    GestureDetector(
                      onTap: widget.onTap,
                        child: const Text("Login now",style: TextStyle(fontWeight: FontWeight.bold))),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
