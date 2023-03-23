import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


const baseURL = 'http://192.168.12.180:8000';
const loginURL = '$baseURL/api/auth/login';
const registerURL = '$baseURL/api/auth/register';
const logoutURL = '$baseURL/api/auth/logout';


const postEmployeeURL = '$baseURL/api/employees';
const getEmployeeURL = '$baseURL/api/employees';
const putEmployeeURL = '$baseURL/api/employees/{id}';
const deleteEmployeeURL = '$baseURL/api/employees/{id}';


//const getUserData = '$baseURL/api/user';
//const getUserDataIndex = '$baseURL/api/logindata/{id}';



//const String baseURL = "http://192.168.1.4:8000/api/auth/";
const Map<String, String> headers = {"Content-Type": "application/json"};

errorSnackBar(BuildContext context, String text) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    backgroundColor: Colors.red,
    content: Text(text),
    duration: const Duration(seconds: 1),
  ));
}