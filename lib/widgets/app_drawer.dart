import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tp1_flutter/widgets/drawer_item.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(child: Column(
            children: const [
              CircleAvatar(
                backgroundImage: AssetImage("images/profil.jpg"),
                radius: 50,
              ),
              SizedBox(height: 10),
              Text("Abdelmajid Bousselham"),
            ],
          )),
          DrawerItem("Home","/",Icon(Icons.home)),
          DrawerItem("Contacts","/contacts",Icon(Icons.contacts)),
          DrawerItem("Github Users","/github_users",Icon(Icons.supervised_user_circle)),
          DrawerItem("News","/news",Icon(Icons.newspaper)),
          DrawerItem("Covid 19","/covid",Icon(Icons.airplay_rounded)),
          DrawerItem("About","/about",Icon(Icons.error)),

        ],
      ),
    );
  }
}
