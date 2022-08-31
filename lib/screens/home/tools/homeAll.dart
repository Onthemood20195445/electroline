import 'package:electroline/screens/home/tools/imageSlider.dart';
import 'package:flutter/material.dart';

class homeAll extends StatefulWidget {
  const homeAll({Key? key}) : super(key: key);

  @override
  State<homeAll> createState() => _homeAllState();
}

class _homeAllState extends State<homeAll> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: ListView(
          children: <Widget>[
            imageSlider(),
            Row(children: <Widget>[
              GestureDetector(
                onTap: () => Navigator.pushNamed(context, "3"),
                child: Container(
                  width: 180,
                  height: 180,
                  //margin: EdgeInsets.all(20),
                  padding: EdgeInsets.all(20),
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(7),
                    ),
                    color: Colors.black,
                    child: Column(
                      children: <Widget>[
                        Container(
                          color: Colors.white,
                          child: Image(
                              image: AssetImage('images/gpu.jpg')),
                        ),
                        Container(
                          color: Colors.black,
                          child: Center(
                            child: Text("GPU",
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
              ),
              Container(
                width: 180,
                height: 180,
                //margin: EdgeInsets.all(20),
                padding: EdgeInsets.all(20),
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(7),
                  ),
                  color: Colors.black,
                  child: Column(
                    children: <Widget>[
                      Container(
                        color: Colors.white,
                        child: Image(
                            image: AssetImage('images/cpu.jpg')),
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
            Row(children: <Widget>[
              Container(
                width: 180,
                height: 180,
                //margin: EdgeInsets.all(20),
                padding: EdgeInsets.all(20),
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(7),
                  ),
                  color: Colors.black,
                  child: Column(
                    children: <Widget>[
                      Container(
                        color: Colors.white,
                        child: Image(
                            image: AssetImage(
                                'images/motherboard.jpg')),
                      ),
                      Container(
                        color: Colors.black,
                        child: Center(
                          child: Text("Motherboard",
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
              Container(
                width: 180,
                height: 180,
                //margin: EdgeInsets.all(20),
                padding: EdgeInsets.all(20),
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(7),
                  ),
                  color: Colors.black,
                  child: Column(
                    children: <Widget>[
                      Container(
                        color: Colors.white,
                        child: Image(
                            image: AssetImage('images/ram.jpg')),
                      ),
                      Container(
                        color: Colors.black,
                        child: Center(
                          child: Text("Ram",
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
            Row(children: <Widget>[
              Container(
                width: 180,
                height: 180,
                //margin: EdgeInsets.all(20),
                padding: EdgeInsets.all(20),
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(7),
                  ),
                  color: Colors.black,
                  child: Column(
                    children: <Widget>[
                      Container(
                        color: Colors.white,
                        child: Image(
                          image: AssetImage('images/power.jpg'),
                          height: 90,
                          width: 140,
                        ),
                      ),
                      Container(
                        color: Colors.black,
                        child: Center(
                          child: Text("Power",
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
              Container(
                width: 180,
                height: 180,
                //margin: EdgeInsets.all(20),
                padding: EdgeInsets.all(20),
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(7),
                  ),
                  color: Colors.black,
                  child: Column(
                    children: <Widget>[
                      Container(
                        color: Colors.white,
                        child: Image(
                          image: AssetImage('images/cases.jpg'),
                          width: 140,
                          height: 90,
                        ),
                      ),
                      Container(
                        color: Colors.black,
                        child: Center(
                          child: Text("Cases",
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
            Row(children: <Widget>[
              Container(
                width: 180,
                height: 180,
                //margin: EdgeInsets.all(20),
                padding: EdgeInsets.all(20),
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(7),
                  ),
                  color: Colors.black,
                  child: Column(
                    children: <Widget>[
                      Container(
                        color: Colors.white,
                        child: Image(
                          image: AssetImage('images/cooling.jpg'),
                          height: 90,
                          width: 140,
                        ),
                      ),
                      Container(
                        color: Colors.black,
                        child: Center(
                          child: Text("Fans",
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
              Container(
                width: 180,
                height: 180,
                //margin: EdgeInsets.all(20),
                padding: EdgeInsets.all(20),
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(7),
                  ),
                  color: Colors.black,
                  child: Column(
                    children: <Widget>[
                      Container(
                        color: Colors.white,
                        child: Image(
                          image: AssetImage('images/acces.jpg'),
                          height: 90,
                          width: 200,
                        ),
                      ),
                      Container(
                        color: Colors.black,
                        child: Center(
                          child: Text("Accesories",
                              style: TextStyle(
                                fontSize: 25,
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
    );
  }
}
