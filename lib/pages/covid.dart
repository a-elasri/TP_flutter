import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providiers/covid_stat.dart';

class Covid extends StatelessWidget{

  TextEditingController textEditingController=new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Covide "),
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            Row(children: [
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
                  Provider.of<CovidStat>(context,listen: false).searchPays(textEditingController.text);
                },
                icon: Icon(Icons.search),
              )
            ],
            ),
            Expanded(
                child: Consumer<CovidStat>(
                    builder: (context,covid_res,child) {
                      return ListView.builder(
                        padding: EdgeInsets.all(10),
                        itemCount: covid_res.covid == null || covid_res.covid ["All"] == null ? 0 : 1,
                        itemBuilder: (context, index) {
                          return Card(

                            elevation: 100,
                            shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                    bottomRight: Radius.circular(2),
                                    topRight: Radius.circular(2))),
                            //side: BorderSide( color: Colors.black)),
                            child: Container(
                              padding: EdgeInsets.all(10),
                              child: Column(
                                children: <Widget>[
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      const Icon(
                                        Icons.info_outline,
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      Text("${textEditingController.text} Corona Cases",
                                          style: const TextStyle(
                                            fontSize: 17,
                                            fontWeight: FontWeight.w500,
                                          )),
                                    ],
                                  ),
                                  Divider(),
                                  Row(
                                    children: <Widget>[
                                      Flexible(
                                          child: ListTile(
                                            title: const Text(
                                              "LastUpdated:",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w500),
                                            ),
                                            subtitle: Text(
                                                covid_res.covid ["All"]["updated"].toString(),
                                                style: TextStyle()),
                                          ))
                                    ],
                                  ),
                                  titleWidget(
                                      'Confirmed',
                                      covid_res.covid ["All"]["confirmed"].toString() ?? '',
                                      Colors.blue),
                                  titleWidget(
                                      'Recovered',
                                      covid_res.covid ["All"]["recovered"].toString() ?? '',
                                      Colors.green),
                                  titleWidget(
                                      'Deaths',
                                      covid_res.covid ["All"]["deaths"].toString() ?? '',
                                      Colors.red),
                                ],
                              ),
                            ),
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
  Widget titleWidget(title, subtitle, color) {
    return ListTile(
      title: Text(title,
          style: TextStyle(
              color: color, fontSize: 17, fontWeight: FontWeight.w500)),
      trailing: Text(subtitle, style: TextStyle(color: color, fontSize: 14)),
    );
  }
}