import 'package:flutter/cupertino.dart';

class ContactsStat extends ChangeNotifier{

  List<String> data=[];
  void addItem(String text){
    data.add(text);
    notifyListeners();
  }
}