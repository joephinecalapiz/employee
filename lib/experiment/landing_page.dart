
import 'package:flutter/material.dart';
import 'package:frontend_diaryapp/screens/login_screen.dart';


class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {

    return SizedBox(
      width: double.infinity,
      child: SizedBox(
        width: double.infinity,
        height: 800,
        child: Stack(
          children: [
            Positioned(
              left: 0,
              top: 0,
              child: Container(
                width: 360,
                height: 800,
                decoration: const BoxDecoration (
                  color: Color(0xff19191c),
                  image: DecorationImage (
                    fit: BoxFit.fill,
                    image: AssetImage (
                      'assets/images/landing-bg.jpg',
                    ),
                  ),
                ),
                child: Center(
                  child: SizedBox(
                    width: double.infinity,
                    height: 800,
                    child: Container(
                      decoration: const BoxDecoration (
                        color: Color(0x66000000),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              left: 27,
              top: 190,
              child: SizedBox(
                width: 206,
                height: 350,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: const EdgeInsets.fromLTRB(0, 0, 0, 25),
                      width: 142,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            margin: const EdgeInsets.fromLTRB(0, 0, 0, 30),
                            width: double.infinity,
                            child: const Text(
                              'Welcome to',
                              textAlign: TextAlign.center,
                              style: TextStyle (
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                                height: 1,
                                fontFamily: "Mynerve",
                                letterSpacing: -0.4079999924,
                                color: Colors.cyan,
                              ),
                            ),
                          ),
                          const Text(
                            'My Diary',
                            style: TextStyle (
                              fontSize: 40,
                              fontWeight: FontWeight.bold,
                              height: 0.5,
                              fontFamily: "Oranienbaum",
                              letterSpacing: -0.4079999924,
                              color: Colors.cyan,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      constraints: const BoxConstraints (
                        maxWidth: 300,
                      ),
                      child: const Text(
                        'Keep a diary, and someday it will keep you! - mae west',
                        style: TextStyle (
                          fontSize: 13,
                          fontFamily: "Oranienbaum",
                          fontWeight: FontWeight.w400,
                          height: 1.5,
                          color: Color(0xffffffff),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              left: 250,
              top: 650,
              child: Align(
                child: SizedBox(
                  width: 82,
                  height: 82,
                  child: TextButton(
                    onPressed: () async{
                      Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) =>  const LoginScreen()
                          )
                      );
                    },
                    style: TextButton.styleFrom (
                      padding: EdgeInsets.zero,
                    ),
                    child: const Icon(Icons.arrow_circle_right_sharp,
                      size: 75,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
