import 'package:electroline/models/sign_in.dart';
import 'package:electroline/models/signout.dart';
import 'package:electroline/screens/account.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class settings extends StatefulWidget {
  final FirebaseAuth auth;
  const settings({Key? key, required this.auth}) : super(key: key);

  @override
  State<settings> createState() => _settingsState();
}

class _settingsState extends State<settings> {
  @override
  void initState() {
    super.initState();
    state();
  }

  Future<void> state() async {
    await widget.auth.authStateChanges().listen((User? user) {
      if (user == null) {
        print('User is currently signed out!');
        Navigator.popAndPushNamed(context, "4");
      } else {
        print('User is signed in!');
        Navigator.popAndPushNamed(context, "5");
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(
        value: 1,
        color: Colors.red.shade900,
      ),
    );
  }
}
