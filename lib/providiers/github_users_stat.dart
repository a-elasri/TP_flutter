import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class GithubStat extends ChangeNotifier{

  var users=null;

  void searchGithubUser(userKey){
    String url="https://api.github.com/search/users?q=${userKey}&per_page=10&page=0";
    http.get(Uri.parse(url))
        .then((response) {
      users= json.decode(response.body);
      notifyListeners();
    }).catchError((onError){
      print(onError);
    });
  }
}