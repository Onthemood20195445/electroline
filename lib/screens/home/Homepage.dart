import 'package:electroline/drawer.dart';
import 'package:electroline/bottomNavigationBar.dart';
import 'package:electroline/screens/home/media/ContactUs.dart';
import 'package:electroline/screens/home/tools/HomeSales.dart';
import 'package:electroline/screens/home/tools/homeAll.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    Key? key,
  }) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      body: DefaultTabController(
        length: 3,
        child: Column(
          children: <Widget>[
            TabBar(
                labelColor: Colors.red[900],
                unselectedLabelColor: Colors.black,
                indicatorColor: Colors.red[900],
                tabs: [
                  Tab(
                    text: "All",
                  ),
                  Tab(
                    text: "Sales",
                  ),
                  Tab(
                    text: "Contact Us",
                  )
                ]),
            Expanded(
                child: TabBarView(
              children: [
                homeAll(),
                HomeSales(),
                ContactUs(),
              ],
            ))
          ],
        ),
      ),
      bottomNavigationBar: bottomBar(Cindex: _index, context: context),
    );
  }
}
