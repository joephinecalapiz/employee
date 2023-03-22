import 'package:dio/dio.dart';

Dio dio() {
  Dio dio = new Dio();

  //ios
  //dio.options.baseUrl = "http://localhost:8000/api";
  //android
  dio.options.baseUrl = "http://192.168.43.37:8000/api";

  dio.options.headers['accept'] = 'Application/Json';


  return dio;
}
