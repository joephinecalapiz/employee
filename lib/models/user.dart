import 'package:shared_preferences/shared_preferences.dart';

class User {
  int? id;
  String? name;
  String? email;
  String? avatar;
  String? token;

  User({
    this.id,
    this.name, 
    this.email,
    this.avatar,
    this.token
    }
  );

  factory User.fromJson(Map<String,dynamic>json){
    return User(
      id: json['user']['id'],
      name: json['user']['name'],
      avatar: json['user']['avatar'],
      email: json['user']['email'],
      token: json['token']
    );
  }
  
}

Future<String> getToken()async{
  SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.getString('token') ?? '';
}
Future<int> getUserId()async{
  SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.getInt('user_id') ?? 0;
}

Future<bool> logoutNow()async{
  SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.remove('token');
}