import 'package:dio/dio.dart';

//client
class DioHelper {
  static Dio? dioObject;
//creat dio
  static init() { 
    dioObject =Dio(
      BaseOptions(
          baseUrl: 'http://newsapi.org/', receiveDataWhenStatusError: true),
    );
  }

  //get
  static Future<Response> getDate({
    required String url,
    required Map<String, dynamic> queryParameter,
  }) async {
    return await dioObject!.get(url, queryParameters: queryParameter);
  }
}
