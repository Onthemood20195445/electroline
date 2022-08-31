import 'package:electroline/drawer.dart';
import 'package:webview_flutter/webview_flutter.dart';

import 'package:flutter/material.dart';

import '../../../bottomNavigationBar.dart';

class SocialMedia extends StatefulWidget {
  late String link;
  SocialMedia({Key? key ,required this.link}) : super(key: key);

  @override
  State<SocialMedia> createState() => SocialMediaState();
}

class SocialMediaState extends State<SocialMedia> {
  int _index = 1;

  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: AppBar(
            elevation: 0,
            title: Text('Welcome to ElectroLine!',
                style: TextStyle(
                    color: Colors.black,
                    fontFamily: 'GreatVibes',
                    fontWeight: FontWeight.bold,
                    fontSize: 30)),
            backgroundColor: Colors.red[900],
          ),
          drawer: appdrawer(),
          body: WebView(
            initialUrl: '${widget.link}',
            javascriptMode: JavascriptMode.unrestricted,
          ),
          bottomNavigationBar: bottomBar(Cindex: _index, context: context),
        ));
  }
}
