import 'package:flutter/material.dart';
import 'package:frontend_diaryapp/experiment/landing_page.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          colorScheme: ColorScheme.fromSwatch().copyWith(
            primary: Colors.cyan,
            secondary: Colors.black,
          )),

      home: const Scaffold(
        resizeToAvoidBottomInset: false,
        body: SingleChildScrollView(
          child: LandingPage(),
        ),
      ),
    );
  }
}
