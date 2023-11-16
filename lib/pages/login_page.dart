import 'package:chat_messenger_app/components/my_button.dart';
import 'package:chat_messenger_app/components/my_text_field.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../services/auth/auth_service.dart';


class LoginPage extends StatefulWidget {

  final void Function ()? onTap;
  const LoginPage({super.key, required this.onTap});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

    final  emailController=TextEditingController();
    final  passwordController=TextEditingController();


    Future<void> signIn() async {
      final authSirvice=Provider.of<AuthService>(context,listen: false);
      try{
        await authSirvice.signInWithEmailandPassword(
          emailController.text,
          passwordController.text
        );

      }
      catch(e){
              ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                      content: Text(e.toString())
                  ),
              );
      }
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
                //----------------Welcome Message----------------
               const Text("Welcome back you've been missed! ",
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
                const SizedBox(height: 25,),
                //----------------signin button----------------
                MyButton(onTap: () => signIn, text: "Sign in"),
                const SizedBox(height: 50,),
                 Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Not a member?"),
                    const SizedBox(width: 4,),
                    GestureDetector(
                      onTap: widget.onTap,
                        child: const Text("Register now",style: TextStyle(fontWeight: FontWeight.bold))),
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
