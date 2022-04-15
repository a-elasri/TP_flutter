import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tp1_flutter/pages/about.dart';
import 'package:tp1_flutter/pages/contacts.dart';
import 'package:tp1_flutter/pages/covid.dart';
import 'package:tp1_flutter/pages/github_users.dart';
import 'package:tp1_flutter/pages/home.dart';
import 'package:tp1_flutter/pages/news_articles.dart';
import 'package:tp1_flutter/providiers/contacts_stat.dart';
import 'package:tp1_flutter/providiers/covid_stat.dart';
import 'package:tp1_flutter/providiers/github_users_stat.dart';
import 'package:tp1_flutter/providiers/news_articles.dart';

void main(){
runApp(MyApp());
}
class MyApp extends StatelessWidget{
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
      ChangeNotifierProvider(create: (context)=>ContactsStat()),
      ChangeNotifierProvider(create: (context)=>GithubStat()),
      ChangeNotifierProvider(create: (context)=>NewsStat()),
     ChangeNotifierProvider(create: (context)=>CovidStat()),

    ],

      child:MaterialApp(
        theme: ThemeData(
            primarySwatch: Colors.green,
            textTheme: const TextTheme(
              //bodyText1: TextStyle(color: Colors.grey)
            )
        ),
        routes: {
          "/":(context)=>Home(),
          "/contacts":(context)=>Contacts(),
          "/github_users":(context)=>GitHubUsers(),
          "/news":(context)=>NewsArticles(),
          "/about":(context)=>About(),
          "/covid":(context)=>Covid(),
        },
      ),
    );
  }

}