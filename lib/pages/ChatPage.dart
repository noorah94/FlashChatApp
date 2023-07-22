import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../globals.dart';
import '../widgets/MessagesList.dart';
import '../widgets/SendMessageRow.dart';

class ChatPage extends StatefulWidget {
  ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(userModel.email), actions: [
        IconButton(
          onPressed: () async {
            await FirebaseAuth.instance.signOut();
            Navigator.pop(context);
          },
          icon: Icon(Icons.close),
        ),
      ]),
      body: Column(
        children: [
          MessagesList(),
          SendMessageRow(),
        ],
      ),
    );
  }
}
