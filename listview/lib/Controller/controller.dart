//import 'package:flutter/material.dart';
import 'package:listview/Model/university.dart';
import 'package:listview/Repository/repository.dart';

class Controller {
  list(value) async {
    Repository repository = new Repository();
    List<University> university = [];
    university = await repository.listModel(value);
    return university;
  }
}
