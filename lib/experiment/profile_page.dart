import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:frontend_diaryapp/screens/login_screen.dart';
import 'dart:io';
import 'package:path/path.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';



class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  File? pfp;
  File? background;

  Future pickImage(ImageSource source) async {
    try {
      final pfp = await ImagePicker().pickImage(source: source);
      if (pfp == null) return;

      //final pfpTemp = File(pfp.path);
      final permImage = await saveImagePerm(pfp.path);
      setState(() => this.pfp = permImage);
    } on PlatformException catch (e) {
      print('Failed to pick image: $e');
    }
  }

  Future<File> saveImagePerm(String imagePath) async {
    final directory = await getApplicationDocumentsDirectory();
    final name = basename(imagePath);
    final pfp = File('${directory.path}/$name');
    return File(imagePath).copy(pfp.path);
  }

  Future bgPickImage(ImageSource source) async {
    try {
      final background = await ImagePicker().pickImage(source: source);
      if (background == null) return;

      //final pfpTemp = File(pfp.path);
      final permBgImage = await saveBgPerm(background.path);
      setState(() => this.background = permBgImage);
    } on PlatformException catch (e) {
      print('Failed to pick image: $e');
    }
  }

  Future<File> saveBgPerm(String imagePath) async {
    final directory = await getApplicationDocumentsDirectory();
    final name = basename(imagePath);
    final pfp = File('${directory.path}/$name');
    return File(imagePath).copy(pfp.path);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Stack(
        children: [
          Positioned(
            left: 0,
            top: 0,
            child: Align(
              child: SizedBox(
                  width: 360,
                  height: 360,
                  child: background != null
                      ? Image.file(background!, fit: BoxFit.cover)
                      : Image.asset(
                    'assets/images/logo-diary.png',
                    fit: BoxFit.cover,
                  )),
            ),
          ),
          Positioned(
            left: 315,
            top: 30,
            child: Align(
              child: SizedBox(
                width: 24.69,
                height: 24,
                child: InkWell(
                  onTap: () {
                    showModalBottomSheet<void>(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30)),
                      context: context,
                      builder: (BuildContext context) {
                        return Column(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            ListTile(
                              leading: const Icon(Icons.image),
                              title: const Text('Pick Image In Gallery'),
                              onTap: () {
                                bgPickImage(ImageSource.gallery);
                                Navigator.of(context).pop(context);
                              },
                            ),
                            ListTile(
                              leading: const Icon(Icons.camera),
                              title: const Text('Use Camera'),
                              onTap: () {
                                bgPickImage(ImageSource.camera);
                                Navigator.of(context).pop(context);
                              },
                            ),
                          ],
                        );
                      },
                    );
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        color: Colors.blue,
                        border: Border.all(color: Colors.blue)),
                    child: const Icon(
                      Icons.camera_alt,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            left: 0.0015,
            top: 320,
            child: Align(
              child: SizedBox(
                width: 360,
                height: 448,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius:
                    BorderRadius.circular(31.384),
                    color: const Color(0xffffffff),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            left: 122.0015258789,
            top: 406,
            child: TextButton(
              onPressed: () async{
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const LoginScreen()
                    )
                );
              },
              style: TextButton.styleFrom(
                padding: EdgeInsets.zero,
              ),
              child: Container(
                width: 113,
                height: 37,
                decoration: BoxDecoration(
                  color: const Color(0xff0075ff),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Center(
                  child: Text(
                    'Logout',
                    style: TextStyle(
                      fontSize: 11.050,
                      fontWeight: FontWeight.w500,
                      height: 1.5,
                      color: const Color(0xffffffff),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            left: 138.00,
            top: 370,
            child: Align(
              child: SizedBox(
                width: 82,
                height: 23,
                child: Text(
                  '@Joephine',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                    height: 1.5,
                    color: const Color(0xff000000),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            left: 138.001,
            top: 280,
            child: Align(
              child: InkWell(
                onTap: () {
                  showModalBottomSheet<void>(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30)),
                    context: context,
                    builder: (BuildContext context) {
                      return Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          ListTile(
                            leading: const Icon(Icons.image),
                            title: const Text('Pick Image In Gallery'),
                            onTap: () {
                              pickImage(ImageSource.gallery);
                              Navigator.of(context).pop(context);
                            },
                          ),
                          ListTile(
                            leading: const Icon(Icons.camera),
                            title: const Text('Use Camera'),
                            onTap: () {
                              pickImage(ImageSource.camera);
                              Navigator.of(context).pop(context);
                            },
                          ),
                        ],
                      );
                    },
                  );
                },
                child: SizedBox(
                  width: 84,
                  height: 84,
                  child: pfp != null
                      ? ClipOval(
                    child: Image.file(
                      pfp!,
                      fit: BoxFit.cover,
                    ),
                  )
                      : const CircleAvatar(
                    backgroundImage: AssetImage(
                        'assets/images/amor.jpg'),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            left: 190,
            top: 333,
            child: Align(
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: Colors.blue,
                    border: Border.all(width: 5, color: Colors.blue)),
                child: const Icon(
                  Icons.camera_alt,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future <void> logoutDialog(BuildContext context) async {
    return showDialog <void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Confirm Logout'),
          content: SingleChildScrollView(
            child: ListBody(
              children: const <Widget>[
                //Text('Confirm Deletion?'),
                Text('Do you want to Logout?'),
              ],
            ),
          ),
          actions: <Widget>[
            ElevatedButton(
              child: const Text('Yes'),
              onPressed: () async{
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const LoginScreen()
                    )
                );
              },

            ),
            ElevatedButton(
              child: const Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}

