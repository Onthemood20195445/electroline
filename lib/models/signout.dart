import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:electroline/screens/account.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:electroline/main.dart';

import '../bottomNavigationBar.dart';

class sout extends StatefulWidget {
  int Cindex;
  BuildContext context;
  sout({Key? key, required this.context, required this.Cindex})
      : super(key: key);

  @override
  State<sout> createState() => _soutState();
}

class _soutState extends State<sout> {
  List<Widget> dataListWidget(AsyncSnapshot snapshot) {
    return snapshot.data.docs.map<Widget>((document) {
      return ListTile(
        title: Text(document['name']),
        subtitle: Text(document['city']),
      );
    }).toList();
  }

  void showAlertDialog(BuildContext context) {
    var alertDialog = CupertinoAlertDialog(
      title: Text(
        'Sign out',
        style: TextStyle(color: Colors.red[900]),
      ),
      content: Text(
        'Are you sure you want to sign out! ',
        style: TextStyle(fontSize: 15),
      ),
      actions: [
        ElevatedButton(
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.grey)),
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text("No", style: TextStyle(color: Colors.white))),
        ElevatedButton(
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.black)),
            onPressed: () async {
              await FirebaseAuth.instance.signOut();
              Navigator.push(

                  context,
                  MaterialPageRoute(
                    builder: (context) => account(),
                  ));
            },
            child: Text("Yes", style: TextStyle(color: Colors.white))),
      ],
    );
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return alertDialog;
        });
  }

  Color c = Colors.black;
  bool ob = true;
  var emaill = FirebaseAuth.instance.currentUser?.email;
  var pass = '';
  var confirmpass = '';
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(automaticallyImplyLeading: false,
          centerTitle: true,
          elevation: 0,
          title: Text('Settings',
              style: TextStyle(
                  color: Colors.black,
                  fontFamily: 'GreatVibes',
                  fontWeight: FontWeight.bold,
                  fontSize: 30)),
          backgroundColor: Colors.red[900],
        ),
        body: ListView(
          shrinkWrap: true,
          children: <Widget>[
            SizedBox(
              height: 40,
            ),
            /* Container(
              child: StreamBuilder(
                stream: FirebaseFirestore.instance.collection('customers').snapshots(),
                builder: (context, snapshot){
                  return ListView(
                    children: dataListWidget(snapshot),
                  );
                },
              ),
            ),*/
            SizedBox(
              height: 20,
            ),
            SizedBox(
              height: 20,
            ),
            SizedBox(
              height: 40,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: TextButton(
                onPressed: () {
                  setState(() {
                    showAlertDialog(context);
                  });
                },
                style: ButtonStyle(
                  fixedSize: MaterialStateProperty.all(Size(300, 50)),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                          side: BorderSide(color: Colors.white))),
                  backgroundColor: MaterialStateProperty.all(Colors.red[900]),
                ),
                child: FittedBox(
                  child: Text(
                    "Sign-out".toUpperCase(),
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
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
        ));
  }
}
