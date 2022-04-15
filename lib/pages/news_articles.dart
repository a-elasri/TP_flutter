import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tp1_flutter/pages/web_view_news.dart';

import '../providiers/news_articles.dart';

class NewsArticles extends StatelessWidget{
  TextEditingController textEditingController=new TextEditingController();
  TextEditingController textEditingControllerDate=new TextEditingController();

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar:AppBar(
        title: Text("News"),
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
              children: [
                TextField(
                  controller: textEditingController,
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.search),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                      )
                  ),
                ),
                TextField(
                  controller: textEditingControllerDate,
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.search),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                      )
                  ),
                ),
                MaterialButton(
                    color: Colors.blueAccent,
                    child: const Icon(Icons.search),
                    onPressed: (){
                      Provider.of<NewsStat>(context,listen: false).searchNews(textEditingController.text, textEditingControllerDate.text);
                    },
                    ),
            Expanded(
                child: Consumer<NewsStat>(
                  builder: (context,newsStat,child){
                    return ListView.builder(
                        padding: EdgeInsets.all(20.0),
                        itemCount: newsStat.article==null||newsStat.article["articles"]==null?0:newsStat.article["articles"].length,
                        itemBuilder: (context,index){
                        return ListTile(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(
                                builder: (context)=>
                                WebViewNews(newsStat.article["articles"][index]["url"],
                                  newsStat.article["articles"][index]["urlToImage"],
                                    newsStat.article["articles"][index]["title"],
                                    newsStat.article["articles"][index]["description"],
                                    newsStat.article["articles"][index]["author"])
                            ));
                          },
                          leading: CircleAvatar(
                            backgroundImage: NetworkImage(newsStat.article["articles"][index]["urlToImage"].toString()),
                          ),
                          title: Text(newsStat.article["articles"][index]["title"]),
                          subtitle: Text(newsStat.article["articles"][index]["publishedAt"]),
                        );
                        });
                  }
                ))
          ],
        ),
      ),
    );
  }
}