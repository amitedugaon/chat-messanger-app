import 'package:flutter/material.dart';




class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        AuthService{
        // instance of the auth service
        final FirebaseAuth _firebaseAuth=FirebaseAuth.instance;

        // sign user in

        Future<UserCredential> signInWithEmailandPassword(String email, String password) async {
      try{
        UserCredential credential= await _firebaseAuth.signInWithEmailAndPassword
          (email: email, password: password);

        return credential;
      } on FirebaseAuthException catch(e){
        Future<UserCredential> signInWithEmailandPassword(String email, String password) async {
          try{
            UserCredential credential= await _firebaseAuth.signInWithEmailAndPassword
              (email: email, password: password);

            return credential;
          } on FirebaseAuthException catch(e){
            Future<UserCredential> signInWithEmailandPassword(String email, String password) async {
              try{
                UserCredential credential= await _firebaseAuth.signInWithEmailAndPassword
                  (email: email, password: password);

                return credential;
              } on FirebaseAuthException catch(e){
                Future<UserCredential> signInWithEmailandPassword(String email, String password) async {
                  try{
                    UserCredential credential= await _firebaseAuth.signInWithEmailAndPassword
                      (email: email, password: password);

                    return credential;
                  } on FirebaseAuthException catch(e){
                    Future<UserCredential> signInWithEmailandPassword(String email, String password) async {
                      try{
                        UserCredential credential= await _firebaseAuth.signInWithEmailAndPassword
                          (email: email, password: password);

                        return credential;
                      } on FirebaseAuthException catch(e){

    );
  }
}
