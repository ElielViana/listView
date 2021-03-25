import 'package:dio/dio.dart';

class RestApi {
  Dio dio = Dio();
  Response response;

  Future<dynamic> universityResearch(String universityName) async {
    response =
        await dio.get("http://universities.hipolabs.com" + universityName);
    return response.data;
  }
}
