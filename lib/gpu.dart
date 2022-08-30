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
          body: Center(
            child: Container(
                child: ListView(
                  children: [
                    Row(children: <Widget>[
                      Container(
                        width: 180,
                        height: 180,
                        //margin: EdgeInsets.all(20),
                        //padding: EdgeInsets.all(20),
                        child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                          color: Colors.black,
                          child: Column(
                            children: <Widget>[
                              Container(
                                color: Colors.black,
                                child: Image(
                                    image: AssetImage('images/rtx80.jpg')),
                              ),
                              Container(
                                color: Colors.black,
                                child: Center(
                                  child: Text("NIVIDIA GeFore Rtx 3080",
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontFamily: "Times",
                                        color: Colors.red[900],
                                      )),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      SizedBox(width: 30,),
                      Container(
                        width: 180,
                        height: 180,
                        //margin: EdgeInsets.all(20),
                        //padding: EdgeInsets.all(20),
                        child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                          color: Colors.black,
                          child: Column(
                            children: <Widget>[
                              Container(
                                color: Colors.white,
                                child: Image(
                                    image: AssetImage('images/rtx3080.jpg')),
                              ),
                              Container(
                                color: Colors.black,
                                child: Center(
                                  child: Text("CPU",
                                      style: TextStyle(
                                        fontSize: 30,
                                        fontFamily: "Times",
                                        color: Colors.red[900],
                                      )),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ]),
                  ],

                ),
              ),
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
