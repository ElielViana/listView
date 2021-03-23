import 'package:dio/dio.dart';

class RestApi {
  Future search(value) async {
    Response response;
    Dio dio = new Dio();
    response =
        await dio.get("http://universities.hipolabs.com/search?name=" + value);
    return response.data;
  }
}
