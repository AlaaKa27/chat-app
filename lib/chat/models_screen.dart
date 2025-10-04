   import 'package:flutter/material.dart';


   class ModelsScreen extends StatefulWidget {
  const ModelsScreen({super.key});

  @override
  State<ModelsScreen> createState() => _ModelsScreenState();
}

class _ModelsScreenState extends State<ModelsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        child: Column(
          children: [
            Row(children: [
              Image.asset('image/alaa2.png', height: 50,),
            ],)
          ],
        ),
      ),
    );
  }
} 