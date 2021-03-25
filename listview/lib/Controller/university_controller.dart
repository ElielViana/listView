//import 'package:flutter/material.dart';
import 'package:listview/Model/university.dart';
import 'package:listview/Repository/repository.dart';

class Controller {
  Repository repository = Repository(); //instancia no escopo da classe
  Future<List<University>> universutyList(String universityName) async {
    List<University> universityList = [];
    universityList = await repository.universityList(universityName);
    return universityList;
  }
}
