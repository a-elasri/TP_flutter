import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class NewsStat extends ChangeNotifier{

  var article=null;

  void searchNews(String userKey,String date){
    String url="https://newsapi.org/v2/everything?q=${userKey}&from=${date}&apiKey=669ecc62908648fca371c4733703e9bf";
    http.get(Uri.parse(url))
        .then((response) {
      article= json.decode(response.body);
      notifyListeners();
    }).catchError((onError){
      print(onError);
    });
  }
}