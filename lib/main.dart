
import 'package:electroline/screens/details/components/cart_screen.dart';
import 'package:flutter/material.dart';
import 'package:electroline/screens/home/Homepage.dart';
import 'screens/product-view.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';



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
      theme: ThemeData.light(),
        debugShowCheckedModeBanner: false,
        home: MyHomePage(),
    routes: {
      '0': (context) => MyHomePage(),
      '1': (context) => MyHomePage(),
      '2': (context) => cart(),
      '3': (context) => gpu(),


    });
  }
}
