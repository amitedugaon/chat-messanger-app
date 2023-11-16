import 'package:flutter/material.dart';

class ChatBubb extends StatelessWidget {
  final String message;
   ChatBubb({super.key, required this.message}) ;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(0),
        color: Colors.blue,
      ),
      child: Text(
        message,
        style: TextStyle(fontSize:16,color: Colors.white ),
      ),
    );
  }
}
