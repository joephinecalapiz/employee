import 'dart:convert';
import 'package:frontend_diaryapp/employees/employee.dart';
import 'package:http/http.dart' as http;


class Services {
  static const ROOT = 'http://192.168.1.4:8000/api/employ/employees/';
  static const _CREATE_TABLE_ACTION = 'CREATE_TABLE';
  static const _GET_ALL_ACTION = 'GET_ALL';
  static const _ADD_EMP_ACTION = 'ADD_EMP';
  static const _UPDATE_EMP_ACTION = 'UPDATE_EMP';
  static const _DELETE_EMP_ACTION = 'DELETE_EMP';


  static Future<List<Employee>> getEmployees() async {
    try {
      var map = Map<String, dynamic>();
      map['action'] = _GET_ALL_ACTION;
      final response = await http.get(Uri.parse(ROOT));
      print('getEmployees Response: ${response.body}');
      print(response.statusCode);
      print(200 == response.statusCode);
      if (200 == response.statusCode) {
        List<Employee> list = parseResponse(response.body);
        print(list.length);
        return list;
      } else {
        return <Employee>[];
      }
    } catch (e) {
      return <Employee>[];
    }
  }

  static List<Employee> parseResponse(String responseBody) {
    final parsed = json.decode(responseBody);
    print(parsed);
    return parsed.map<Employee>((json) => Employee.fromJson(json)).toList();
  }


  static Future<bool> addEmployee(String firstName, String lastName) async {
    try {
      var map = <String, dynamic>{};
      map['action'] = _ADD_EMP_ACTION;
      map['first_name'] = firstName;
      map['last_name'] = lastName;
      final response = await http.post(Uri.parse(ROOT), body: map);
      print('addEmployee Response: ${response.body}');
      if (200 == response.statusCode) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      return false;
    }
  }


  static Future<bool> updateEmployee(String empId, String firstName, String lastName) async {
    try {
      var map = <String, dynamic>{};
      map['action'] = _UPDATE_EMP_ACTION;
      map['id'] = empId;
      map['first_name'] = firstName;
      map['last_name'] = lastName;
      final response = await http.put(Uri.parse(ROOT + empId), body: map);
      print('updateEmployee Response: ${response.body}');
      if (200 == response.statusCode) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      return false;
    }
  }


  static Future<bool> deleteEmployee(String empId) async {
    try {
      final response = await http.delete(Uri.parse(ROOT + empId));
      print('deleteEmployee Response: ${response.body}');
      if (200 == response.statusCode) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      return false;
    }
  }
}