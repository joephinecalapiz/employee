import 'package:flutter/material.dart';

class ProfileHelp extends StatelessWidget {
  String email = '';
  String password = '';
  String name = '';

  ProfileHelp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: (Colors.white),
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: (Colors.cyan),
        title: const Text('Profile Help', style: TextStyle(color: Colors.black)),
      ),
      body: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          Container(
            margin: const EdgeInsets.fromLTRB(0, 50, 0, 0),
            width: double.infinity,
            child: SizedBox(
              width: 5,
              height: 120,
              child: CircleAvatar(
                child:Image.asset(
                  'assets/images/logo-diary.png',
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),

          const SizedBox(height: 70),
          const Center(
            child:ExpansionTile(
              leading: Icon(
                  Icons.info_rounded,
                  size: 22,
                  color: Colors.black),
              title: Text('Contact Information',
                style: TextStyle(
                    fontSize: 22,
                    fontFamily: "Oranienbaum",
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
              childrenPadding: EdgeInsets.all(30),
              children: [
                Padding(padding: EdgeInsets.all(10)),
                Text("CONTACT INFORMATION\n\n"
                    "A Contact Us page is essential to building a brand’s website as it allows visitors to contact "
                    "you easily without leaving their browser. \nThey also give you the opportunity to capture leads"
                    " and improve customer service. \nGenerally, visitors can also leave feedback or ask questions "
                    "through these channels.\n You’ll receive valuable information about your customers’ preferences and "
                    "expectations if done correctly."


                    "\n\nThe essential elements of an excellent Contact Us page include a clear call to action, "
                    "easy navigation, and a message that resonates with visitors. \nKeep these things in mind when designing"
                    " a Contact Us page: Don’t overload visitors with too much information, use readable text, and create "
                    "a landing page that converts. \nA well-designed contact page should include several elements, such as a"
                    "phone number, email address, and social media links. \n\nIn addition, a Contact Us page must be easily "
                    "visible on your navigation bar. It can be frustrating for a consumer to hunt through a website to find"
                    " out how to contact a company",
                    style: TextStyle(
                        fontSize: 18,
                        fontFamily: "Oranienbaum",
                        color: Colors.black)),
              ],
            ),
          ),
          const SizedBox(height: 40),

          const Center(
            child:ExpansionTile(
              leading: Icon(
                  Icons.contact_phone_rounded,
                  size: 22,
                  color: Colors.black),
              title: Text('CONTACT US',
                style: TextStyle(
                    fontSize: 22,
                    fontFamily: "Oranienbaum",
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
              childrenPadding: EdgeInsets.all(30),
              children: [
                Padding(padding: EdgeInsets.all(10)),
                Text("If you have questions or queries , please contact us at:\n\n"
                    "email: joephinecalapiz.work@gmail.com\n\n\n "
                    "Phonenumber: 09518052760",

                    style: TextStyle(
                        fontSize: 18,
                        fontFamily: "Oranienbaum",
                        color: Colors.black)),
              ],
            ),
          ),

        ],
      ),
    );
  }
}