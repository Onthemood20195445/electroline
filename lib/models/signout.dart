import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:electroline/models/sign_in.dart';
import 'package:electroline/screens/account.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:electroline/main.dart';

import '../bottomNavigationBar.dart';

class sout extends StatefulWidget {
  final FirebaseAuth auth;
  sout({Key? key,required this.auth})
      : super(key: key);

  @override
  State<sout> createState() => _soutState();
}

class _soutState extends State<sout> {
  late final emailAddress;
  late final profilePhoto;
  @override
  void initState() {

    super.initState();
    info();

  }
  void info() {
    final user = widget.auth.currentUser;
    if (user != null) {
      for (final providerProfile in user.providerData) {
        // ID of the provider (google.com, apple.com, etc.)
        emailAddress = providerProfile.email;
        profilePhoto = providerProfile.photoURL;

      }
    }
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
              await widget.auth.signOut();
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => account(auth: widget.auth,),

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          centerTitle: true,
          elevation: 0,
          title: Text('Settings',
              style: TextStyle(
                  color: Colors.white,
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

            Container(
              child: Row(mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Email: $emailAddress',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,)),
                  //Image.network(profilePhoto)
                ],
              ),
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
        bottomNavigationBar: bottomBar(context: context,Cindex: 3),);
  }
}
