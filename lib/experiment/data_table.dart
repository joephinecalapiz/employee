import 'dart:convert';
import 'package:frontend_diaryapp/models/user.dart';
import 'package:frontend_diaryapp/screens/login_screen.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:frontend_diaryapp/experiment/add_data.dart';
import 'package:frontend_diaryapp/services/global.dart';

class HomeData extends StatefulWidget {
  const HomeData({ Key? key }) : super(key: key);

  @override
  _HomeDataState createState() => _HomeDataState();
}

class _HomeDataState extends State<HomeData> {
  List allData = <dynamic>[];
  int user_id = 0;

  Future getData()async{
    String token = await getToken();
    user_id = await getUserId();
    var headers = {
      'Content-Type':'application/json',
      'Authorization':'Bearer $token'
    };
    final uri = Uri.parse('$getEmployeeURL/$user_id');
    final response = await http.get(uri,headers: headers);
    var data = jsonDecode(response.body) as Map;
    var tentative = data['data'] as List;
    print(response.body);
    setState(() {
      allData = tentative;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Trial'),
        automaticallyImplyLeading: false,
        centerTitle: true,
        actions: [
          IconButton(onPressed: (){
            logoutNow().then((value) => Navigator.push(context, MaterialPageRoute(builder: (context)=>const LoginScreen())));
          }, icon: const Icon(Icons.logout))
        ],
      ),
      body: RefreshIndicator(
        onRefresh: getData,
        child: ListView.builder(
          itemCount: allData.length,
          itemBuilder: (context,index){
            var data = allData[index] as Map;
            var fName = data['first_name'];
            var lName = data['last_name'];
            return ListTile(
              title: Text(fName),
              subtitle: Text(lName),
            );
          }),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=> const AddData()));
        }
        ),
    );
  }
}