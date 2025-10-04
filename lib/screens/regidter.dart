import 'package:chatzoo_app/screens/chat_screen.dart';
import 'package:chatzoo_app/widget/my_batton.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class register extends StatefulWidget {
  static const String screenrouts = 'register';
  const register({super.key});

  @override
  State<register> createState() => _registerState();
}

class _registerState extends State<register> {
  bool isloading = false;
  bool _obscurePassword = true;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confot = TextEditingController();
  final keyform = GlobalKey<FormState>();

  void _register(BuildContext context) async {
    if (keyform.currentState!.validate()) {
      if (passwordController.text != confot.text) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('كلمة المرور غير متطابقة')),
        );
        return;
      }
      try {
        setState(() {
          isloading = true;
        });
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailController.text,
          password: passwordController.text,
        );

        Navigator.pushReplacementNamed(context, ChatScreen.screenrouts);
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('خطأ في التسجيل')),
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
                    height: 200,
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
                  SizedBox(
                    height: 20,
                  ),
                  //form
                  Form(
                    key: keyform,
                    child: Column(
                      children: [
                        TextFormField(
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'يرجى أضافة البريد الإلكتروني';
                            }
                            if (!value.contains('@')) {
                              return 'يرجى أضافة البريد الإلكتروني بشكل صحيح';
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
                                  color: Color.fromARGB(255, 10, 224, 231),
                                  width: 2),
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                        SizedBox(height: 20),
                        TextFormField(
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'يرجى أضافة كلمة المرور';
                            }
                            if (value.length < 6) {
                              return 'كلمة المرور يجب أن تكون أكثر من 6 أحرف';
                            }
                            return null;
                          },
                          obscureText: _obscurePassword,
                          controller: passwordController,
                          onChanged: (value) {},
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
                                  color: Color.fromARGB(255, 10, 224, 231),
                                  width: 2),
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          //
                        ),
                        SizedBox(height: 20),
                        TextField(
                          obscureText: _obscurePassword,
                          controller: confot,
                          onChanged: (value) {},
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
                            hintText: 'confort your password',
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
                                  color: Color.fromARGB(255, 10, 224, 231),
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
                          color: Color.fromARGB(255, 10, 224, 231),
                          titel: 'REGISTER',
                          onpressed: () => _register(context),
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
