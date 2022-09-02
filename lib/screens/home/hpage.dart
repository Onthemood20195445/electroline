import 'package:electroline/drawer.dart';
import 'package:electroline/bottomNavigationBar.dart';
import 'package:electroline/screens/home/media/ContactUs.dart';
import 'package:electroline/screens/home/tools/HomeSales.dart';
import 'package:electroline/screens/home/tools/homeAll.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class hpage extends StatefulWidget {
  int Cindex;
  BuildContext context;
  hpage({Key? key, required this.context, required this.Cindex})
      : super(key: key);

  @override
  State<hpage> createState() => _hpageState();
}

class _hpageState extends State<hpage> {
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
      bottomNavigationBar:  BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(label: 'Home', icon: Icon(Icons.home)),
          BottomNavigationBarItem(
              label: 'Favourite', icon: FaIcon(FontAwesomeIcons.heart)),
          BottomNavigationBarItem(
              label: 'Cart', icon: Icon(Icons.shopping_cart)),
          BottomNavigationBarItem(
              label: 'Settings', icon: Icon(Icons.settings))
        ],
        currentIndex: widget.Cindex,
        unselectedItemColor: Colors.black,
        selectedItemColor: Colors.white,
        backgroundColor: Colors.red[900],
        onTap: (int index) {
          setState(() {
            this.widget.Cindex = index;
            if (index == 0) {
              Navigator.pushNamed(widget.context, "5");
            } else if (index == 1) {
              this.widget.Cindex = 0;
              Navigator.pushNamed(widget.context, "6");
            } else if (index == 2) {
              this.widget.Cindex = 0;
              Navigator.pushNamed(widget.context, "7");
            } else if (index == 3) {
              Navigator.pushNamed(widget.context, "4");
            }
          });
        },
      )
    );
  }
}
