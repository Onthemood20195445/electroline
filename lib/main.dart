
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:electroline/Homepage.dart';



void main() {
  runApp(const MyApp());
}



class MyApp extends StatefulWidget {
  const MyApp({
    Key? key,
  }) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
        debugShowCheckedModeBanner: false,
        home: MyHomePage(),
    routes: {
      '0': (context) => MyHomePage(),




    });
  }
}
