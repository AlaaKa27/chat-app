import 'package:chatzoo_app/screens/regidter.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {
  static const String screenrouts = 'ChatScreen';
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.limeAccent,
        titleTextStyle: TextStyle(
            color: Color.fromARGB(255, 10, 224, 231),
            fontSize: 20,
            fontWeight: FontWeight.w400),
        title: Text('chatzoo'),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () async {
              try {
                await FirebaseAuth.instance.signOut();
                if (mounted) {
                  Navigator.pushReplacementNamed(context, register.screenrouts);
                }
              } catch (e) {
                if (mounted) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('فشل في تسجيل الخروج')),
                  );
                }
              }
            },
            icon: Icon(Icons.logout),
            color: Color.fromARGB(255, 10, 224, 231),
            iconSize: 30,
          ),
        ], //
        leading: Padding(
          padding: const EdgeInsets.only(left: 6),
          child: Row(
            children: [
              Image.asset(
                'image/alaa2.png',
                height: 50,
              ),
            ],
          ),
        ),
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(),
            Container(
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(
                      color: Color.fromARGB(255, 10, 224, 231), width: 2),
                ),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: TextField(
                      onChanged: (value) {},
                      decoration: InputDecoration(
                        hintText: 'Enter your message',
                        hintStyle: TextStyle(color: Colors.black),
                        contentPadding:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Icon(
                      Icons.send,
                      color: Color.fromARGB(255, 10, 224, 231),
                      size: 30,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
