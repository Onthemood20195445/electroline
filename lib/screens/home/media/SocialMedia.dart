import 'dart:io';

import 'package:electroline/drawer.dart';
import 'package:webview_flutter/webview_flutter.dart';

import 'package:flutter/material.dart';

import '../../../bottomNavigationBar.dart';

class SocialMedia extends StatefulWidget {
  late String link;
  SocialMedia({Key? key, required this.link}) : super(key: key);

  @override
  State<SocialMedia> createState() => SocialMediaState();
}

class SocialMediaState extends State<SocialMedia> {
  int _index = 0;
  var loadingPercentage = 0;
  @override
  void initState() {
    super.initState();
    // Enable virtual display.
    if (Platform.isAndroid) WebView.platform = AndroidWebView();
  }

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
          body: Stack(children: [
            WebView(
              initialUrl: '${widget.link}',
              javascriptMode: JavascriptMode.unrestricted,
              onPageStarted: (url) {
                setState(() {
                  loadingPercentage = 0;
                });
              },
              onProgress: (progress) {
                setState(() {
                  loadingPercentage = progress;
                });
              },
              onPageFinished: (url) {
                setState(() {
                  loadingPercentage = 100;
                });
              },
            ),
            if (loadingPercentage < 100)
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Loading..$loadingPercentage\%",
                      style: TextStyle(fontSize: 20),
                    ),
                    SizedBox(height: 5),
                    CircularProgressIndicator(
                      value: loadingPercentage / 100.0,
                      //minHeight: 10,
                      color: Colors.red[900],
                      backgroundColor: Colors.grey,
                    ),
                  ],
                ),
              ),
          ]),
          bottomNavigationBar: bottomBar(Cindex: _index, context: context),
        ));
  }
}
