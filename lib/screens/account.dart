import 'package:electroline/bottomNavigationBar.dart';
import 'package:electroline/models/sign_in.dart';
import 'package:electroline/models/sign_up.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class account extends StatefulWidget {
  final FirebaseAuth auth;
  const account({Key? key,required this.auth}) : super(key: key);

  @override
  State<account> createState() => _accountState();
}

class _accountState extends State<account> {
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
      body: GestureDetector(
        child: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => naccount(auth: widget.auth,),
                    ));
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
                  "Sign up".toUpperCase(),
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 40,
            ),
            TextButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => signin(auth: widget.auth,),
                    ));
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
                  "Sign in".toUpperCase(),
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        )),
      ),
      bottomNavigationBar: bottomBar(context: context, Cindex: 3),
    );
  }
}
