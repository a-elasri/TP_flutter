import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tp1_flutter/providiers/contacts_stat.dart';

class Contacts extends StatelessWidget {
  TextEditingController textController = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Contacts"),
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.contacts),
                      hintText: "Entrez un nom",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15)
                      )
                    ),
                    controller: textController,
                  ),
                ),
                IconButton(
                    onPressed: () {
                   Provider.of<ContactsStat>(context,listen: false).addItem(textController.text);
                }, icon: Icon(Icons.add))
              ],
            ),
            Expanded(
              child: Consumer<ContactsStat>(
                builder: (context, contactsStat,child) {
                 return ListView.builder(
                    itemCount:contactsStat.data.length ,
                    itemBuilder: (context, index) {
                      return ListTile(
                        leading: CircleAvatar(child: Text(contactsStat.data[index].substring(0,1))),
                        title: Text(contactsStat.data[index]),
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
