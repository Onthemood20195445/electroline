import 'package:electroline/drawer.dart';
import 'package:electroline/bottomNavigationBar.dart';
import 'package:flutter/material.dart';

class gpu extends StatefulWidget {
 const gpu({Key? key}) : super(key: key);

  @override
  State<gpu> createState() => gpuState();
}

class gpuState extends State<gpu> {
  int _index = 3;

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
          drawer: appdrawer(),
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
          bottomNavigationBar: bottomBar(Cindex: _index, context: context),
        ));
  }
}
