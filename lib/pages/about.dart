import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

void main() => runApp(About());
class About extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("About"),
        ),
        body: Column(
          children: [
            SizedBox(
              height: MediaQuery
                  .of(context)
                  .padding
                  .top,
            ),
            const Flexible(
              child: WebView(
                initialUrl: 'https://github.com/a-elasri',
                javascriptMode: JavascriptMode.unrestricted,
              ),
            ),
          ],
        ));
  }
}
