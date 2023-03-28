import 'dart:convert';

import 'package:frontend_diaryapp/experiment/help_page.dart';
import 'package:frontend_diaryapp/experiment/home_calendar.dart';
import 'package:frontend_diaryapp/experiment/privacy_page.dart';
import 'package:frontend_diaryapp/experiment/profile_page.dart';
import 'package:frontend_diaryapp/models/user.dart';
import 'package:frontend_diaryapp/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';


class MainDrawer extends StatefulWidget {
  const MainDrawer({Key? key}) : super(key: key);

  @override
  State<MainDrawer> createState() => _MainDrawerState();
}

class _MainDrawerState extends State<MainDrawer> {
  late SharedPreferences preferences;

  @override
  Widget build(BuildContext context) {

    return Drawer(
        child: Column(
          children: <Widget>[
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              color: Colors.cyan,
              child: Center(
                child: Column(
                  children: <Widget>[
                    Container(
                      width: 100,
                      height: 100,
                      margin: EdgeInsets.only(top: 50),
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                              image: AssetImage('assets/images/amor.jpg'),
                              fit: BoxFit.fill
                          )
                      ),
                    ),
                    const SizedBox(height: 15),
                    const Text("Joephine Calapiz",
                        style: TextStyle(
                            fontSize: 22,
                            fontFamily: "Mynerve",
                            fontWeight: FontWeight.bold,
                            color: Colors.white)
                    ),
                    const SizedBox(height: 5),

                    const Text("joephinecalapiz7@gmail.com",
                        style: TextStyle(
                            fontSize: 18,
                            fontFamily: "Mynerve",
                            //fontWeight: FontWeight.bold,
                            color: Colors.white)
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(height: 15),
            ListTile(
              leading: const Icon(Icons.person_rounded,
                  size: 22,
                  color: Colors.black87),
              title: const Text('Profile',
                  style: TextStyle(
                      fontSize: 22,
                      fontFamily: "Oranienbaum",
                      fontWeight: FontWeight.bold,
                      color: Colors.black87)
              ),
              onTap: (){
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ProfilePage())
                );
              },
            ),
            SizedBox(height: 15),
            ListTile(
              leading: Icon(Icons.edit_note_outlined, size: 22,
                  color: Colors.black87),
              title: const Text('Diary',
                  style: TextStyle(
                      fontSize: 22,
                      fontFamily: "Oranienbaum",
                      fontWeight: FontWeight.bold,
                      color: Colors.black87)
              ),
              onTap: (){
                Navigator.pop(context);
              },
            ),
            SizedBox(height: 15),
            ListTile(
              leading: const Icon(Icons.calendar_month_rounded,
                  size: 22,
                  color: Colors.black87),
              title: const Text('Calendar',
                  style: TextStyle(
                      fontSize: 22,
                      fontFamily: "Oranienbaum",
                      fontWeight: FontWeight.bold,
                      color: Colors.black87)
              ),
              onTap: (){
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => HomePage())
                );
              },
            ),
            const SizedBox(height: 15),
            ExpansionTile(
              leading: const Icon(Icons.settings_rounded,
                  size: 22,
                  color: Colors.black87),
              title: const Text('Settings',
                  style: TextStyle(
                      fontSize: 22,
                      fontFamily: "Oranienbaum",
                      fontWeight: FontWeight.bold,
                      color: Colors.black87)
              ),
              childrenPadding: EdgeInsets.only(left: 60),
              children: [
                ListTile(
                  title: const Text('Privacy Information',
                      style: TextStyle(
                          fontSize: 15,
                          fontFamily: "Oranienbaum",
                          fontWeight: FontWeight.bold,
                          color: Colors.black87)),
                  onTap: (){
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => PrivacyInformation())
                    );
                  },
                ),
                ListTile(
                  title: const Text('Profile Help',
                      style: TextStyle(
                          fontSize: 15,
                          fontFamily: "Oranienbaum",
                          fontWeight: FontWeight.bold,
                          color: Colors.black87)),
                  onTap: (){
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ProfileHelp())
                    );
                  },
                ),
              ],

            ),
            const SizedBox(height: 50),
            ListTile(
              leading: const Icon(Icons.logout_rounded,
                  size: 22,
                  color: Colors.black87),
              title: const Text('Logout',
                  style: TextStyle(
                      fontSize: 22,
                      fontFamily: "Oranienbaum",
                      fontWeight: FontWeight.bold,
                      color: Colors.black87)
              ),
              onTap: (){
                logoutNow().then((value) =>
                    Navigator.push(context, MaterialPageRoute(
                        builder: (context)=>const LoginScreen())));
              },
            ),

          ],
        )
    );
  }


}
