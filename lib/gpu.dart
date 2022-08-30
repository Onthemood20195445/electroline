import 'package:webview_flutter/webview_flutter.dart';

import 'package:flutter/material.dart';

class gpu extends StatefulWidget {
  gpu({Key? key}) : super(key: key);

  @override
  State<gpu> createState() => gpuState();
}

class gpuState extends State<gpu> {
  int _index = 1;

  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            elevation: 0,
            title: Text('GPU',
                style: TextStyle(
                    color: Colors.black,
                    fontFamily: 'GreatVibes',
                    fontWeight: FontWeight.bold,
                    fontSize: 30)),
            backgroundColor: Colors.red[900],
          ),
          drawer: Drawer(
            width: 200,
            backgroundColor: Colors.black,
            child: ListView(
              children: <Widget>[
                DrawerHeader(
                    child: Text(
                  "Build your dream PC :)",
                  style: TextStyle(color: Colors.red[900], fontSize: 30),
                )),
                ListTile(
                  title: Text(
                    'Graphics Card',
                    style: TextStyle(color: Colors.red[900]),
                  ),
                  trailing:
                      Icon(Icons.arrow_forward_ios, color: Colors.red[900]),
                ),
                ListTile(
                  title: Text(
                    'CPUs',
                    style: TextStyle(color: Colors.red[900]),
                  ),
                  trailing:
                      Icon(Icons.arrow_forward_ios, color: Colors.red[900]),
                ),
                ListTile(
                  title: Text(
                    'Motherboards',
                    style: TextStyle(color: Colors.red[900]),
                  ),
                  trailing:
                      Icon(Icons.arrow_forward_ios, color: Colors.red[900]),
                ),
                ListTile(
                  title: Text(
                    'Meomery',
                    style: TextStyle(color: Colors.red[900]),
                  ),
                  trailing:
                      Icon(Icons.arrow_forward_ios, color: Colors.red[900]),
                ),
                ListTile(
                  title: Text(
                    'Power supplies',
                    style: TextStyle(color: Colors.red[900]),
                  ),
                  trailing:
                      Icon(Icons.arrow_forward_ios, color: Colors.red[900]),
                ),
                ListTile(
                  title: Text(
                    'Cases',
                    style: TextStyle(color: Colors.red[900]),
                  ),
                  trailing:
                      Icon(Icons.arrow_forward_ios, color: Colors.red[900]),
                ),
                ListTile(
                  title: Text(
                    'Fans & Cooling Components',
                    style: TextStyle(color: Colors.red[900]),
                  ),
                  trailing:
                      Icon(Icons.arrow_forward_ios, color: Colors.red[900]),
                ),
                ListTile(
                  title: Text(
                    'Accesories',
                    style: TextStyle(color: Colors.red[900]),
                  ),
                  trailing:
                      Icon(Icons.arrow_forward_ios, color: Colors.red[900]),
                )
              ],
            ),
          ),
          body: SafeArea(
            child: Column(children: [
              SizedBox(height: 5,),
              Container(
                height: 180,
                width: 160,
                decoration: BoxDecoration(color: Colors.black,
                  borderRadius: BorderRadius.circular(16)
                ),
                child: Image.asset('images/gpu.jpg'),
                
              ),
              Text('ggg'),
              Text('\$290'),

            ]),
          ),
          bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            items: [
              BottomNavigationBarItem(label: 'Home', icon: Icon(Icons.home)),
              BottomNavigationBarItem(
                  label: 'User', icon: Icon(Icons.person_outline)),
              BottomNavigationBarItem(
                  label: 'Cart', icon: Icon(Icons.shopping_cart)),
              BottomNavigationBarItem(
                  label: 'Settings', icon: Icon(Icons.settings))
            ],
            currentIndex: _index,
            unselectedItemColor: Colors.black,
            selectedItemColor: Colors.black,
            backgroundColor: Colors.red[900],
            onTap: (int index) {
              setState(() {
                this._index = index;
                if (index == 0) {
                  Navigator.pushNamed(context, "0");
                } else if (index == 1) {
                  Navigator.pushNamed(context, "1");
                } else if (index == 2) {
                  Navigator.pushNamed(context, "2");
                }
              });
            },
          ),
        ));
  }
}
