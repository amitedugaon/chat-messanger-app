import 'package:chat_messenger_app/services/auth/auth_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'chat_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final FirebaseAuth _auth=FirebaseAuth.instance;
  void signOut(){
    final authService=Provider.of<AuthService>(context,listen: false);
    authService.signOut();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
                appBar: AppBar(
                  title: Text("Home page"),
                  actions: [
                    IconButton(
                      icon: Icon(Icons.add),
                      onPressed: () {
                       signOut();
                      },
                    ),
                  ],
                ),

      body: _buildUserList(),
    );
  }
  Widget _buildUserList(){
    return StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection("users").snapshots(),
        builder: (context, snapshot) {
              if(snapshot.hasError){
                return const Text("error");
              }
              if(snapshot.connectionState==ConnectionState.waiting){
                return Text("loading");
              }
              return ListView(
                children:snapshot.data!.docs.map<Widget>((doc) => _buildUserListItem(doc)).toList(),
              );
        },
    );
  }

  Widget _buildUserListItem(DocumentSnapshot documents){
    Map<String,dynamic> data=documents.data()! as Map<String,dynamic>;
    if(_auth.currentUser!.email!=data['email']){
      return ListTile(
        title: Text(data['email']),
        onTap: (){
          Navigator.push(context,MaterialPageRoute(builder: (context)=>ChatPage(receiverUserEmail: data['email'],receiverUserId: data['uid'],)));
        },
      );
    }
    else{
      return Container();
    }
  }
}
