import 'package:electroline/models/signout.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class naccount extends StatefulWidget {
  final FirebaseAuth auth;
  const naccount({Key? key,required this.auth}) : super(key: key);

  @override
  State<naccount> createState() => _naccountState();
}

class _naccountState extends State<naccount> {
  void showAlertDialog(BuildContext context) {
    var alertDialog = CupertinoAlertDialog(
      title: Text(
        'Error message',
        style: TextStyle(color: Colors.red[900]),
      ),
      content: Text(
        'Check email or password',
        style: TextStyle(fontSize: 15),
      ),
      actions: [
        ElevatedButton(
            style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all(Colors.red.shade900)),
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text("Okay", style: TextStyle(color: Colors.black))),
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
          title: Text('Sign up',
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
            Image(image: AssetImage('images/logo.png')),
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
            Container(
              //Password
              margin: EdgeInsets.symmetric(horizontal: 20),
              child: TextFormField(
                onChanged: (value) {
                  confirmpass = value;
                },
                decoration: InputDecoration(
                  labelText: "Confirm password",
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
              height: 40,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: TextButton(
                onPressed: () async {
                  setState(() async {
                    if (pass != confirmpass || emaill == '') {
                      showAlertDialog(context);
                    } else {
                      try {
                        final newUser =
                            await widget.auth.createUserWithEmailAndPassword(
                                email: emaill, password: pass);
                        if (newUser != null) {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    sout(auth: _auth,),
                              ));
                          //Navigator.pushNamed(context, '0');
                        }
                      } catch (e) {
                        print(e);
                      }
                    }
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
                    "Sign-up".toUpperCase(),
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
        ));
  }
}
