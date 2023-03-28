import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:frontend_diaryapp/models/user.dart';
import 'package:http/http.dart' as http;

import '../services/global.dart';
class AddData extends StatefulWidget {
  final Map? todo;

  const AddData({ Key? key, this.todo }) : super(key: key,);

  @override
  _AddDataState createState() => _AddDataState();
}

class _AddDataState extends State<AddData> {
  var formKey = GlobalKey<FormState>();

  TextEditingController fNameController = TextEditingController();
  TextEditingController lNameController = TextEditingController();
  bool isEdit = false;

  @override
  void initState() {
    final todos = widget.todo;

    super.initState();
    if (todos != null) {
      isEdit = true;
      final first_name = todos['first_name'];
      final last_name = todos['last_name'];
      fNameController.text = first_name;
      lNameController.text = last_name;
    }
  }

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

  Future<void> updateData() async {
    final todo = widget.todo;
    if (todo == null) {
      return;
    }
    final id = todo['_id'];
    //final isCompleted = todo['is_completed'];
    final first_name = fNameController.text;
    final last_name = lNameController.text;
    final body = {
      "first_name": first_name,
      "last_name": last_name,
      "is_completed": false,
    };
    final url = '$baseURL/api/employees/{$id}';
    //final url = 'http://192.168.43.37:8000/api/employees/{$id}';
    //final url = 'https://api.nstack.in/v1/todos/$id';
    final uri = Uri.parse(url);

    final response = await http.put(uri,
        body: jsonEncode(body), headers: {'Content-Type': 'application/json'});

    if (response.statusCode == 200) {
      fNameController.text = '';
      lNameController.text = '';

      showSuccessMessage('Update Diary successfully');
    } else {
      showErrorMessage('Update unsuccessful');
    }
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(isEdit ? 'EDIT DIARY' : 'ADD YOUR DAY',
          style: const TextStyle(
              fontFamily: "Mynerve",
              fontWeight: FontWeight.bold),
        ),

        //title: const Text('Add Data'),
      ),
        body: Container(
          height: 900,
          width: double.infinity,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/bg.jpg'),
              fit: BoxFit.cover,
            ),
          ),
          child: Form(
              key: formKey,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              child: ListView(
                padding: const EdgeInsets.all(20),
                children: [
                  TextFormField(
                    controller: fNameController,
                    keyboardType: TextInputType.datetime,
                    decoration: const InputDecoration(
                      hintText: '01-21-2022',
                      labelText: 'Date Today',),
                    validator: (value) {
                      return (value == '') ? 'Required Date' : null;
                    },
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    controller: fNameController,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      hintText: 'phone number',
                      labelText: 'number',),
                    validator: (value) {
                      return (value == '') ? 'Required Date' : null;
                    },
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                      onPressed: isEdit ? updateData : addData,
                      child: Padding(
                          padding: const EdgeInsets.all(20),
                        child: Text(isEdit ? 'update' : 'save'),
                  ))],
              )),
        ));

  }
  void showSuccessMessage(String message) {
    final snackBar = SnackBar(
        content: Text(message, style: const TextStyle(color: Colors.green)));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
  void showErrorMessage(String message) {
    final snackBar = SnackBar(
        content:
        Text(message, style: const TextStyle(color: Colors.redAccent)));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }



}