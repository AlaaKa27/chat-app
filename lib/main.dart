import 'package:chatzoo_app/firebase_options.dart';
import 'package:chatzoo_app/screens/chat_screen.dart';
import 'package:chatzoo_app/screens/regidter.dart';
import 'package:chatzoo_app/screens/singin_screen.dart';
import 'package:chatzoo_app/screens/welcom_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      //home: const SinginScreen(),
      initialRoute: WelcomScreen.screenrouts,
      routes: {
        WelcomScreen.screenrouts: (context) => const WelcomScreen(),
        SinginScreen.screenrouts: (context) => const SinginScreen(),
        register.screenrouts: (context) => const register(),
        ChatScreen.screenrouts: (context) => const ChatScreen(),
      },
    );
  }
}
