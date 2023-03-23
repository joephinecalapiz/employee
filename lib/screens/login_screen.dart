import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:frontend_diaryapp/employees/HomePage.dart';
import 'package:frontend_diaryapp/screens/registration.dart';
import 'package:frontend_diaryapp/services/authservices.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../services/global.dart';
import '../utility/rounded_button.dart';


class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String _email = '';
  String _password = '';

  loginPressed() async {
    if (_email.isNotEmpty && _password.isNotEmpty) {
      http.Response response = await AuthServices.login(_email, _password);
      Map responseMap = jsonDecode(response.body);
      if (response.statusCode == 200) {
      }
      else {
        errorSnackBar(context, responseMap.values.first);
      }
      pageRoute(responseMap['token']);
    }
    else {
      errorSnackBar(context, 'enter all required fields');
    }
  }

  void pageRoute(String token) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    await pref.setString("loginPressed", token);
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (BuildContext context) => DataTableDemo(),
        )
    );
  }

  void registerRoute() {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => const RegisterScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
            child: Container(
                height: 800,
                width: double.infinity,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/bg.jpg'),
                      fit: BoxFit.cover,
                    )
                ),
                child: Stack(
                    children: [
                      Positioned(
                        left: 10,
                        top: 100,
                        child: Container(
                            width: 340,
                            height: 600,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: const Color(0x66ffffff),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 20),
                              child: Column(
                                children: [
                                  const SizedBox(
                                    height: 260,
                                  ),
                                  TextField(
                                    keyboardType: TextInputType.emailAddress,
                                    decoration: const InputDecoration(
                                      hintText: 'Enter your email',
                                    ),
                                    onChanged: (value) {
                                      _email = value;
                                    },
                                  ),
                                  const SizedBox(
                                    height: 30,
                                  ),
                                  TextField(
                                    obscureText: true,
                                    decoration: const InputDecoration(
                                      hintText: 'Enter your password',
                                    ),
                                    onChanged: (value) {
                                      _password = value;
                                    },
                                  ),
                                  const SizedBox(
                                    height: 30,
                                  ),
                                  RoundedButton(
                                    buttonText: 'Login',
                                    onButtonPressed: () => loginPressed(),
                                  ),
                                  const SizedBox(
                                    height: 30,
                                  ),
                                  RoundedButton(
                                    buttonText: 'Register',
                                    onButtonPressed: () => registerRoute(),
                                  )
                                ],
                              ),
                            )
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.fromLTRB(0, 150, 0, 0),
                        width: double.infinity,
                        child: SizedBox(
                          width: 10,
                          height: 150,
                          child: CircleAvatar(
                            child:Image.asset(
                              'assets/images/logo-diary.png',
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                    ]
                )
            )
        )
    );
  }
}
