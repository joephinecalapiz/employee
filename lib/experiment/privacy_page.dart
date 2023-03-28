import 'package:flutter/material.dart';

class PrivacyInformation extends StatelessWidget {

  PrivacyInformation({
    Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: (Colors.white),
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: (Colors.cyan),
        title: Text('Privacy  Information', style: const TextStyle(color: Colors.black)),
      ),
      body: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          Container(
            margin: const EdgeInsets.fromLTRB(0, 30, 0, 0),
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
          const SizedBox(height: 40),
          Center(
            child:ExpansionTile(
              leading: const Icon(Icons.info_rounded, color: Colors.black),
              title: Text('Information',
                style: const TextStyle(
                    fontSize: 18,
                    fontFamily: "Oranienbaum",
                    fontWeight: FontWeight.bold,
                    color: Colors.black87),
              ),
              childrenPadding: EdgeInsets.all(30),
              children: [
                Padding(padding: EdgeInsets.all(10)),
                Text("App Privacy Policy\n"
                    "Last updated [03-01-2023]\n\n"
                    "My Diary Application we respects the privacy of our users. This Privacy Policy explains how we collect, use,"
                    " disclose, and safeguard your information when you visit our mobile application (the “Application”)."
                    "Please read this Privacy Policy carefully. IF YOU DO NOT AGREE WITH THE TERMS OF THIS PRIVACY POLICY, "
                    "PLEASE DO NOT ACCESS THE APPLICATION.\n\n"

                    "We reserve the right to make changes to this Privacy Policy at any time and for any reason. We will alert "
                    "you about any changes by updating the “Last updated” date of this Privacy Policy. You are encouraged to "
                    "periodically review this Privacy Policy to stay informed of updates. You will be deemed to have been made aware "
                    "of, will be subject to, and will be deemed to have accepted the changes in any revised Privacy Policy by your"
                    " continued use of the Application after the date such revised Privacy Policy is posted."

                    "This Privacy Policy does not apply to the third-party online/mobile store from which you install the Application"
                    " or make payments, including any in-game virtual items, which may also collect and use data about you. We are not"
                    " responsible for any of the data collected by any such third party.\n\n"

                    "This Privacy Policy was created using Termly’s Privacy Policy Generator."


                    "\nMobile app privacy policies",
                    style: const TextStyle(
                        fontSize: 16,
                        fontFamily: "Oranienbaum",
                        color: Colors.black87)),
              ],
            ),
          ),
          const SizedBox(height: 20),

          const Center(
            child:ExpansionTile(
              leading: Icon(Icons.mobile_friendly_rounded, color: Colors.black),
              title: Text('Mobile privacy',
                style: TextStyle(
                    fontSize: 18,
                    fontFamily: "Oranienbaum",
                    fontWeight: FontWeight.bold,
                    color: Colors.black87),
              ),
              childrenPadding: EdgeInsets.all(30),
              children: [
                Padding(padding: EdgeInsets.all(10)),
                Text("What is a Mobile App Privacy Policy?\n\n"
                    "A mobile app privacy policy is a legal statement that must be clear, conspicuous, and consented to by all users. "
                    "It must disclose how a mobile app gathers, stores, and uses the personal information it collects from its users. "
                    "\n\n A mobile privacy app is developed and presented to users so that mobile app developers stay compliant with state,"
                    " As a result, they fulfill the legal requirement to safeguard user privacy while protecting the company itself "
                    "from legal challenges.\n\n"
                    "What is Personal Information (PI)?"
                    "\n\nPersonal information is information you may use directly or indirectly to identify an individual. "
                    "If separate and distinct items of data can be used in conjunction with other pieces of data to "
                    "eventually identify a physical person, that is also considered personal info and must be protected.",
                    style: TextStyle(
                        fontSize: 16,
                        fontFamily: "Oranienbaum",
                        color: Colors.black87)),
              ],
            ),
          ),
          const SizedBox(height: 20),

          const Center(
            child:ExpansionTile(
              leading: Icon(Icons.privacy_tip_rounded, color: Colors.black),
              title: Text('Applicable Laws for Mobile App Privacy Policies',
                style: TextStyle(
                    fontSize: 18,
                    fontFamily: "Oranienbaum",
                    fontWeight: FontWeight.bold,
                    color: Colors.black87),
              ),
              childrenPadding: EdgeInsets.all(30),
              children: [
                Padding(padding: EdgeInsets.all(10)),
                Text("United States Federal Trade Commission\n\n"
                    "The US Federal Trade Commission (FTC) emphasizes that "
                    "mobile application developers in the United States or "
                    "those who distribute applications to be used in the "
                    "United States should include privacy policies in their applications.\n\n"
                    "The foundation of every privacy policy begins with the Fair Information"
                    " Practice Principles. In 1998, the FTC found that there were five core "
                    "principles of privacy protection that were common in privacy policies "
                    "in most countries. These five principles are:\n\n"
                    "1. Notice prior to collecting data\n"
                    "2. The choice to agree to collection or opt-out \n"
                    "3. Access data for accuracy and correction\n"
                    "4. Security steps to protect user data and delete old data\n"
                    "5. Enforcement to address and remedy privacy concerns\n\n"

                    "What is Personal Information (PI)?"
                    "\n\nPersonal information is information you may use directly or indirectly to identify an individual. "
                    "If separate and distinct items of data can be used in conjunction with other pieces of data to "
                    "eventually identify a physical person, that is also considered personal info and must be protected.",
                    style: TextStyle(
                        fontSize: 16,
                        fontFamily: "Oranienbaum",
                        color: Colors.black87)),
              ],
            ),
          ),
          const SizedBox(height: 20),
          const Center(
            child:ExpansionTile(
              leading: Icon(Icons.info_rounded, color: Colors.black),
              title: Text('General Requirements for Mobile App Privacy Policies',
                style: TextStyle(
                    fontSize: 18,
                    fontFamily: "Oranienbaum",
                    fontWeight: FontWeight.bold,
                    color: Colors.black87),
              ),
              childrenPadding: EdgeInsets.all(30),
              children: [
                Padding(padding: EdgeInsets.all(10)),
                Text("What Is a Privacy Policy?\n"
                    "A privacy policy on your website is a legal document informing users about "
                    "how you collect and handle their personal data, who you share it with, if "
                    "you sell it, and any other relevant details."
                    "You might also call a privacy policy a:"
                    "Privacy Agreement \n Privacy Clause \n Privacy Notice \nPrivacy Page\n "
                    "Privacy Policy Statement"
                    "Specific platforms or services may also require a unique privacy policy template. Examples include:"
                    "\nMobile app privacy policies",
                    style: TextStyle(
                        fontSize: 16,
                        fontFamily: "Oranienbaum",
                        color: Colors.black87)),
              ],
            ),
          ),
          const SizedBox(height: 20),

          const Center(
            child:ExpansionTile(
              leading: Icon(Icons.track_changes_rounded, color: Colors.black),
              title: Text('Inform Mobile Users If They Are Being Tracked',
                style: TextStyle(
                    fontSize: 18,
                    fontFamily: "Oranienbaum",
                    fontWeight: FontWeight.bold,
                    color: Colors.black87),
              ),
              childrenPadding: EdgeInsets.all(30),
              children: [
                Padding(padding: EdgeInsets.all(10)),
                Text("What is a Mobile App Privacy Policy?\n\n"
                    "A mobile app privacy policy is a legal statement that must be clear, conspicuous, and consented to by all users. "
                    "It must disclose how a mobile app gathers, stores, and uses the personal information it collects from its users. "
                    "\n\n A mobile privacy app is developed and presented to users so that mobile app developers stay compliant with state,"
                    " As a result, they fulfill the legal requirement to safeguard user privacy while protecting the company itself "
                    "from legal challenges.\n\n"
                    "What is Personal Information (PI)?"
                    "\n\nPersonal information is information you may use directly or indirectly to identify an individual. "
                    "If separate and distinct items of data can be used in conjunction with other pieces of data to "
                    "eventually identify a physical person, that is also considered personal info and must be protected.",
                    style: TextStyle(
                        fontSize: 16,
                        fontFamily: "Oranienbaum",
                        color: Colors.black87)),
              ],
            ),
          ),
          const SizedBox(height: 20),

          const Center(
            child:ExpansionTile(
              leading: Icon(Icons.verified_user_sharp, color: Colors.black),
              title: Text('How to Give Users Access to Your App’s Privacy Policy',
                style: TextStyle(
                    fontSize: 18,
                    fontFamily: "Oranienbaum",
                    fontWeight: FontWeight.bold,
                    color: Colors.black87),
              ),
              childrenPadding: EdgeInsets.all(30),
              children: [
                Padding(padding: EdgeInsets.all(10)),
                Text("United States Federal Trade Commission\n\n"
                    "The US Federal Trade Commission (FTC) emphasizes that "
                    "mobile application developers in the United States or "
                    "those who distribute applications to be used in the "
                    "United States should include privacy policies in their applications.\n\n"
                    "The foundation of every privacy policy begins with the Fair Information"
                    " Practice Principles. In 1998, the FTC found that there were five core "
                    "principles of privacy protection that were common in privacy policies "
                    "in most countries. These five principles are:\n\n"
                    "1. Notice prior to collecting data\n"
                    "2. The choice to agree to collection or opt-out \n"
                    "3. Access data for accuracy and correction\n"
                    "4. Security steps to protect user data and delete old data\n"
                    "5. Enforcement to address and remedy privacy concerns\n\n"

                    "What is Personal Information (PI)?"
                    "\n\nPersonal information is information you may use directly or indirectly to identify an individual. "
                    "If separate and distinct items of data can be used in conjunction with other pieces of data to "
                    "eventually identify a physical person, that is also considered personal info and must be protected.",
                    style: TextStyle(
                        fontSize: 16,
                        fontFamily: "Oranienbaum",
                        color: Colors.black87)),
              ],
            ),
          ),
          const SizedBox(height: 20),
          const Center(
            child:ExpansionTile(
              leading: Icon(Icons.fact_check_rounded, color: Colors.black),
              title: Text('FAQs About App Privacy Policies',
                style: TextStyle(
                    fontSize: 18,
                    fontFamily: "Oranienbaum",
                    fontWeight: FontWeight.bold,
                    color: Colors.black87),
              ),
              childrenPadding: EdgeInsets.all(30),
              children: [
                Padding(padding: EdgeInsets.all(10)),
                Text("COLLECTION OF YOUR INFORMATION\n\n"
                    "We may collect information about you in a variety of ways. The information we may collect "
                    "via the Application depends on the content and materials you use, and includes:\n\n "


                    "Personal Data\n\n"
                    "Demographic and other personally identifiable information (such as your name and email address) that you "
                    "voluntarily give to us when choosing to participate in various activities related to the Application, such "
                    "as chat, posting messages in comment sections or in our forums, liking posts, sending feedback, and "
                    "responding to surveys. If you choose to share data about yourself via your profile, online chat, or "
                    "other interactive areas of the Application, please be advised that all data you disclose in these areas "
                    "is public and your data will be accessible to anyone who accesses the Application.\n\n"


                    " Derivative Data \n\n"
                    "Information our servers automatically collect when you access the Application, such as your native "
                    "actions that are integral to the Application, including liking, re-blogging, or replying to a post, as"
                    " well as other interactions with the Application and other users via server log files.\n\n"


                    "Financial Data\n\n"
                    "Financial information, such as data related to your payment method (e.g. valid credit card number, "
                    "card brand, expiration date) that we may collect when you purchase, order, return, exchange, or request"
                    " information about our services from the Application. We store only very limited, if any, financial "
                    "information that we collect. Otherwise, all financial information is stored by our payment processor, "
                    "[Payment Processor Name], and you are encouraged to review their privacy policy and contact them directly "
                    "for responses to your questions.",

                    style: TextStyle(
                        fontSize: 16,
                        fontFamily: "Oranienbaum",
                        color: Colors.black87)),
              ],
            ),
          ),
          const SizedBox(height: 20),

          const Center(
            child:ExpansionTile(
              leading: Icon(Icons.app_settings_alt, color: Colors.black),
              title: Text('General Data Protection Regulation (GDPR)',
                style: TextStyle(
                    fontSize: 18,
                    fontFamily: "Oranienbaum",
                    fontWeight: FontWeight.bold,
                    color: Colors.black87),
              ),
              childrenPadding: EdgeInsets.all(30),
              children: [
                Padding(padding: EdgeInsets.all(10)),
                Text("United States Federal Trade Commission\n\n"
                    "The US Federal Trade Commission (FTC) emphasizes that "
                    "mobile application developers in the United States or "
                    "those who distribute applications to be used in the "
                    "United States should include privacy policies in their applications.\n\n"
                    "The foundation of every privacy policy begins with the Fair Information"
                    " Practice Principles. In 1998, the FTC found that there were five core "
                    "principles of privacy protection that were common in privacy policies "
                    "in most countries. These five principles are:\n\n"
                    "1. Notice prior to collecting data\n"
                    "2. The choice to agree to collection or opt-out \n"
                    "3. Access data for accuracy and correction\n"
                    "4. Security steps to protect user data and delete old data\n"
                    "5. Enforcement to address and remedy privacy concerns\n\n"

                    "What is Personal Information (PI)?"
                    "\n\nPersonal information is information you may use directly or indirectly to identify an individual. "
                    "If separate and distinct items of data can be used in conjunction with other pieces of data to "
                    "eventually identify a physical person, that is also considered personal info and must be protected.",
                    style: TextStyle(
                        fontSize: 16,
                        fontFamily: "Oranienbaum",
                        color: Colors.black87)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}