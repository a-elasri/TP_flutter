import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class CovidStat extends ChangeNotifier{

  var covid=null;

  void searchPays(country){
    String url="https://covid-api.mmediagroup.fr/v1/cases?country=${country}";

    http.get(Uri.parse(url))
        .then((response) {
      covid= json.decode(response.body);
      notifyListeners();
    }).catchError((onError){
      print(onError);
    });
  }
}