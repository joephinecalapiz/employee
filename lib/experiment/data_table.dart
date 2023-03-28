import 'dart:convert';
import 'package:frontend_diaryapp/experiment/diary_details.dart';
import 'package:frontend_diaryapp/models/user.dart';
import 'package:frontend_diaryapp/screens/login_screen.dart';
import 'package:frontend_diaryapp/widget/drawer.dart';
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

  bool isLoading = true;
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


  Future<void> navigateToAddPage() async {
    final route = MaterialPageRoute(builder: (context) => const AddData(),
    );
    await Navigator.push(context, route);
    setState(() {
      isLoading = true;
    });
    getData();
  }

  Future<void> deleteById(String id) async {
    final url = 'http://192.168.43.37:8000/api/employees/{$id}';
    final uri = Uri.parse(url);
    final response = await http.delete(uri);
    if(response.statusCode == 200) {
      final filtered = allData.where((element) => element['_id'] != id).toList();
      setState(() {
        allData = filtered;
        showSuccessMessage('Deleted successfully');
      });
    }
    else {
      showErrorMessage('Unable to Delete');
    }
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('My Diary',
          style: TextStyle(
              fontFamily: "Oranienbaum",
              fontSize: 27,
              fontWeight: FontWeight.bold),),
        //automaticallyImplyLeading: false,
        actions: [
          IconButton(onPressed: (){
            logoutNow().then((value) => Navigator.push(
                context, MaterialPageRoute(
                builder: (context)=>const LoginScreen())));
          }, icon: const Icon(Icons.logout))
        ],
      ),
      drawer: MainDrawer(),
      body: Container(
          height: 900,
          width: double.infinity,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/bg.jpg'),
              fit: BoxFit.cover,
            ),
          ),
          child: RefreshIndicator(
            onRefresh: getData,
            child: ListView.builder(
                itemCount: allData.length,
                itemBuilder: (context,index){
                  var data = allData[index] as Map;
                  //var userId = allData[index] as String;
                  var fName = data['first_name'];
                  //var lName = data['last_name'];
                  return Container(
                      padding: const EdgeInsets.all(10),
                      margin: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10),
                      decoration: const BoxDecoration(
                          color: Colors.cyanAccent),
                      child: Column(
                          children: [
                            ListTile(
                                leading: CircleAvatar(
                                    backgroundColor:
                                    index % 2 == 0 ? Colors.black87 : Colors.black,
                                    foregroundColor: Colors.cyan,
                                    child: Text('${index + 1}',
                                        style: const TextStyle(
                                            fontSize: 18,
                                            fontFamily: "Mynerve",
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white))),
                                title: Text(fName.toUpperCase(),
                                    style: const TextStyle(
                                        fontSize: 22,
                                        fontFamily: "Mynerve",
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black54)),
                                // subtitle: Text(lName,
                                //     style: const TextStyle(
                                //         fontSize: 12,
                                //         fontFamily: "Oranienbaum",
                                //         fontWeight: FontWeight.bold,
                                //         color: Colors.black54)),
                                trailing: PopupMenuButton(
                                  onSelected: (value) {
                                    if(value == 'edit'){
                                      navigateToEditTodo(data);
                                    }

                                    else if(value == 'delete'){
                                      var id = allData[index] as String;
                                      showMyDialog(context, id, index);
                                    }
                                  },
                                  itemBuilder: (context) {
                                    return [
                                      const PopupMenuItem(
                                        value: 'edit',
                                        child: Icon(
                                          Icons.edit_rounded,
                                          color: Colors.green,
                                        ),
                                      ),
                                      const PopupMenuItem(
                                        value: 'delete',
                                        child: Icon(Icons.delete_rounded, color: Colors.red),
                                      ),
                                    ];
                                  },
                                ),
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              DiaryDetails(todo: allData[index]))
                                  );
                                })]
                      ));
                }),
          )),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: navigateToAddPage,
          label: const Text('Add Diary',
            style: TextStyle(
              fontFamily: "Mynerve",),
          ),
        )
    );
  }

  Future<void> navigateToEditTodo(Map item) async {
    final route = MaterialPageRoute(
      builder: (context) => AddData(todo: item),
    );
    await Navigator.push(context, route);
    setState(() {
      isLoading = true;
    });
    getData();
  }


  void showSuccessMessage(String message){
    final snackBar = SnackBar(
        content: Text(message,
            style: const TextStyle(
                color: Colors.green)
        )
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
  void showErrorMessage(String message){
    final snackBar = SnackBar(
        content: Text(message,
            style: const TextStyle(
                color: Colors.redAccent)
        )
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  Future<void> showMyDialog(BuildContext context, String id, index) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Confirm Diary Deletion'),
          content: SingleChildScrollView(
            child: ListBody(
              children:const  <Widget>[
                //Text('Confirm Deletion?'),
                Text('Would you like to delete this Diary?'),
              ],
            ),
          ),
          actions: <Widget>[
            ElevatedButton(
              child: const Text('Yes'),
              onPressed: () async{
                setState(() {
                  deleteById(id);
                  allData.removeAt(index);
                });
                Navigator.of(context).pop();
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