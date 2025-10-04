import 'package:chatzoo_app/screens/chat_screen.dart';
import 'package:chatzoo_app/widget/my_batton.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SinginScreen extends StatefulWidget {
  static const String screenrouts = 'SinginScreen';
  const SinginScreen({super.key});

  @override
  State<SinginScreen> createState() => _SinginScreenState();
}

class _SinginScreenState extends State<SinginScreen> {
  bool _obscurePassword = true;
  bool isloading = false;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final FormName = GlobalKey<FormState>();

  void _signIn() async {
    if (FormName.currentState!.validate()) {
      try {
        //fun1
        setState(() {
          isloading = true;
        });
        await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailController.text,
          password: passwordController.text,
        );

        Navigator.pushReplacementNamed(context, ChatScreen.screenrouts);
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
              content: Text('يرجى التحقق من البريد الإلكتروني وكلمة المرور')),
        );
        setState(() {
          isloading = false;
        });
      }
    } else {
      return;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.limeAccent,
      body: Container(
        width: MediaQuery.sizeOf(context).width,
        height: MediaQuery.sizeOf(context).height,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: [
                  Container(
                    height: 280,
                    child: Image.asset(
                      'image/alaa2.png',
                    ),
                  ),
                  Text('chatzoo',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.w500,
                        color: const Color.fromARGB(255, 243, 162, 243),
                      )),
                  SizedBox(height: 20),
                  // Form
                  Form(
                    key: FormName,
                    child: Column(
                      children: [
                        TextFormField(
                          validator: (text) {
                            if (text!.isEmpty) {
                              return 'يرجى إدخال بريدك الإلكتروني';
                            } else if (!text.contains('@')) {
                              return 'يرجى إدخال بريد إلكتروني صالح';
                            }
                            return null;
                          },
                          keyboardType: TextInputType.emailAddress,
                          controller: emailController,
                          onChanged: (value) {},
                          decoration: InputDecoration(
                            hintText: 'Enter your email',
                            hintStyle: TextStyle(color: Colors.black),
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 20, vertical: 10),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                gapPadding: 10),
                            enabledBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.black, width: 1),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            //
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Color.fromARGB(255, 243, 162, 243),
                                  width: 2),
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                        SizedBox(height: 20),
                        TextFormField(
                          validator: (text) {
                            if (text!.isEmpty) {
                              return 'يرجى إدخال كلمة المرور';
                            } else if (text.length < 6) {
                              return 'يجب أن تكون كلمة المرور أكثر من 6 أحرف';
                            }
                            return null;
                          },
                          obscureText: _obscurePassword,
                          controller: passwordController,
                          decoration: InputDecoration(
                            suffixIcon: IconButton(
                              icon: Icon(
                                _obscurePassword
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                                color: Colors.black,
                              ),
                              onPressed: () {
                                setState(() {
                                  _obscurePassword = !_obscurePassword;
                                });
                              },
                            ),
                            hintText: 'Enter your password',
                            hintStyle: TextStyle(color: Colors.black),
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 20, vertical: 10),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                gapPadding: 10),
                            enabledBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.black, width: 1),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            // focusedBorder: OutlineInputBorder(
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Color.fromARGB(255, 243, 162, 243),
                                  width: 2),
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          //
                        ),
                      ],
                    ),
                  ),

                  SizedBox(height: 10),
                  isloading
                      ? CircularProgressIndicator()
                      : MYBOTTUN(
                          color: Color.fromARGB(255, 243, 162, 243),
                          titel: 'SINGIN',
                          onpressed: () => _signIn(),
                        )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
