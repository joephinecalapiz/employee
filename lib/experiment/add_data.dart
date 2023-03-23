import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:frontend_diaryapp/models/user.dart';
import 'package:http/http.dart' as http;

import '../services/global.dart';
class AddData extends StatefulWidget {
  const AddData({ Key? key }) : super(key: key);

  @override
  _AddDataState createState() => _AddDataState();
}

class _AddDataState extends State<AddData> {
  TextEditingController fNameController = TextEditingController();
  TextEditingController lNameController = TextEditingController();

  Future addData()async{
    String token = await getToken();
    var body = {
      'first_name': fNameController.text,
      'last_name' : lNameController.text
    };
    var headers = {
      "Content-Type" : "application/json",
      'Authorization':'Bearer $token'
    };
    final uri = Uri.parse(postEmployeeURL);
    final response = await http.post(
      uri,
      body: jsonEncode(body),
      headers: headers
    );
    print(token);
    print(response.statusCode);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Data'),
      ),
      body: Form(
        child: Column(
          children: [
            TextField(
              controller: fNameController,
            ),
            TextField(
              controller: lNameController,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: addData, 
              child: const Text('SUBMIT'))
          ],
        )),
    );
  }
}