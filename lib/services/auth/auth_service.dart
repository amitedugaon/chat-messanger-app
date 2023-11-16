import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';


 class AuthService extends ChangeNotifier{
   // instance of the auth service
  final FirebaseAuth _firebaseAuth=FirebaseAuth.instance;
  final FirebaseFirestore _firestor=FirebaseFirestore.instance;



  // sign user in

   Future<UserCredential> signInWithEmailandPassword(String email, String password) async {
     try{
      UserCredential userCredential= await _firebaseAuth.signInWithEmailAndPassword(
          email: email,
          password: password
      );
      _firestor.collection('user').doc(userCredential.user!.uid).set({
        'uid': userCredential.user!.uid,
        'email': email,

      },SetOptions(merge: true));

      return userCredential;
     } on FirebaseAuthException catch(e){
       throw Exception(e.code);
     }
   }

   Future<UserCredential>signUpWithandPassword(String email, password) async {
      try {
                UserCredential userCredential=
                await _firebaseAuth.createUserWithEmailAndPassword(
                    email: email,
                    password: password
                );
            _firestor.collection('user').doc(userCredential.user!.uid).set({
              'uid': userCredential.user!.uid,
              'email': email,

            });

                return userCredential;
      }on FirebaseAuthException catch(e){
           throw Exception(e.code);
      }
   }

    Future<void>signOut()async {
         return await FirebaseAuth.instance.signOut();
    }

}



