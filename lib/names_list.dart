import 'package:get/get.dart';

class NameListController extends GetxController{

  List<String> myList = [];
  int counter = 0;

  increaseCounter(){
    counter++;
  }

  addName(String s){
    myList.add(s);
  }

}