import 'package:listview/Model/university.dart';
import 'package:listview/restApi/restApi.dart';

class Repository {
  RestApi restApi = new RestApi();
  List response = [];
  //correto ser instaciado no escopo da classe pois pode ser chamado em outros metodos se necessário

  Future<List<University>> universityList(String universityName) async {
    List<University> universityList = [];
    String path = "/search?name=";
    path += universityName;
    response = await restApi.universityResearch(path);
    response.forEach((item) {
      University university = University.fromJson(item);
      universityList.add(university);
    });
    return universityList;
  }
}
