import 'package:chatzoo_app/screens/regidter.dart';
import 'package:chatzoo_app/screens/singin_screen.dart';
import 'package:chatzoo_app/widget/my_batton.dart';
import 'package:flutter/material.dart';

class WelcomScreen extends StatefulWidget {
  static const String screenrouts = 'WelcomeScreen';
  const WelcomScreen({super.key});

  @override
  State<WelcomScreen> createState() => _WelcomScreenState();
}

class _WelcomScreenState extends State<WelcomScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.limeAccent,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Column(
            children: [
              Container(
                height: 300,
                child: Image.asset(
                  'image/alaa2.png',
                ),
              ),
              Text('chatzoo',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.w500,
                    color: const Color.fromARGB(255, 10, 224, 231),
                  )),
              SizedBox(height: 20),
              MYBOTTUN(
                color: Colors.white,
                titel: 'SING IN',
                onpressed: () {
                  Navigator.pushNamed(context, SinginScreen.screenrouts);
                },
              ),
              MYBOTTUN(
                color: Color.fromARGB(255, 10, 224, 231),
                titel: 'REGISTER',
                onpressed: () {
                  Navigator.pushNamed(context, register.screenrouts);
                },
              )
            ],
          ),
        ],
      ),
    );
  }
}
