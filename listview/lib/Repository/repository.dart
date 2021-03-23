import 'package:listview/Model/university.dart';
import 'package:listview/restApi/restApi.dart';

class Repository {
  listModel(name) async {
    List<University> listapi = [];
    List response = [];
    RestApi restApi = new RestApi();
    response = await restApi.search(name);
    response.forEach((item) {
      University university = University.fromJson(item);
      listapi.add(university);
    });

    return listapi;
  }
}
