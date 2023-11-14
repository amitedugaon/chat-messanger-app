import 'package:firebase_auth/firebase_auth.dart';


class AuthService{
   // instance of the auth service
  final FirebaseAuth _firebaseAuth=FirebaseAuth.instance;

  // sign user in

   Future<UserCredential> signInWithEmailandPassword(String email, String password) async {
     try{
      UserCredential credential= await _firebaseAuth.signInWithEmailAndPassword
        (email: email, password: password);

      return credential;
     } on FirebaseAuthException catch(e){
       throw Exception(e.code);
     }


   }

// sign user out

}

