import "package:flutter/cupertino.dart";
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providiers/github_users_stat.dart';

class GitHubUsers extends StatelessWidget {

  TextEditingController textEditingController=new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Github Users"),
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(child: TextFormField(
                  controller: textEditingController,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.search),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    )
                  ),
                )),
                IconButton(
                  onPressed: () {
                      Provider.of<GithubStat>(context,listen: false).searchGithubUser(textEditingController.text);
                  },
                  icon: Icon(Icons.search),
                )
              ],
            ),
            Expanded(
              child: Consumer<GithubStat>(
                builder: (context,githubStat,child){
                  return ListView.builder(

                  itemCount:githubStat.users==null||githubStat.users["items"]==null?0: githubStat.users["items"].length,
              itemBuilder: (context, index) {
              return ListTile(
              leading: CircleAvatar(
              backgroundImage: NetworkImage(githubStat.users["items"][index]["avatar_url"]),
              ),
              title: Text(githubStat.users["items"][index]["login"]),
              );
              },);
              }
              )
            )
          ],
        ),
      ),
    );
  }
}
