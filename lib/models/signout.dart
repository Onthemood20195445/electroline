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
            onPressed: () {
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
  var emaill = '';
  var pass = '';
  var confirmpass = '';
  final FirebaseAuth _auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          elevation: 0,
          title: Text('Settings',
              style: TextStyle(
                  color: Colors.black,
                  fontFamily: 'GreatVibes',
                  fontWeight: FontWeight.bold,
                  fontSize: 30)),
          backgroundColor: Colors.red[900],
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back_outlined,
              color: Colors.white,
            ),
            onPressed: () => Navigator.pop(context),
          ),
        ),
        body: ListView(
          shrinkWrap: true,
          children: <Widget>[
            SizedBox(
              height: 40,
            ),
            Container(
              //Username
              margin: EdgeInsets.symmetric(horizontal: 20),
              child: TextFormField(
                onChanged: (value) {
                  emaill = value;
                },
                decoration: InputDecoration(
                    labelText: "Email",
                    labelStyle: TextStyle(
                      color: Colors.red[900],
                    ),
                    border: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Colors.red.shade900, width: 4)),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(28),
                        borderSide: BorderSide(color: Colors.red.shade900)),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.red.shade900),
                      borderRadius: BorderRadius.circular(28),
                    ),
                    prefixIcon: Icon(
                      Icons.person_outlined,
                      color: Colors.red.shade900,
                    )),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              //Password
              margin: EdgeInsets.symmetric(horizontal: 20),
              child: TextFormField(
                onChanged: (value) {
                  pass = value;
                },
                decoration: InputDecoration(
                  labelText: "Password",
                  labelStyle: TextStyle(
                    color: Colors.red.shade900,
                  ),
                  border: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Colors.red.shade900, width: 4)),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(28),
                      borderSide: BorderSide(color: Colors.red.shade900)),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.red.shade900),
                    borderRadius: BorderRadius.circular(28),
                  ),
                  prefixIcon: Icon(
                    Icons.lock_outline,
                    color: Colors.red.shade900,
                  ),
                  suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        if (c == Colors.black) {
                          c = Colors.red.shade900;
                          ob = false;
                        } else {
                          c = Colors.black;
                          ob = true;
                        }
                      });
                    },
                    icon: Icon(
                      Icons.remove_red_eye_outlined,
                      color: c,
                    ),
                  ),
                ),
                obscureText: ob,
              ),
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
                Navigator.pushNamed(widget.context, "0");
              } else if (index == 1) {
                this.widget.Cindex = 0;
                Navigator.pushNamed(widget.context, "1");
              } else if (index == 2) {
                this.widget.Cindex = 0;
                Navigator.pushNamed(widget.context, "2");
              } else if (index == 3) {
                Navigator.pushNamed(widget.context, "4");
              }
            });
          },
        ));
  }
}
