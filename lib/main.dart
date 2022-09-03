import 'package:electroline/models/signout.dart';
import 'package:electroline/screens/account.dart';
import 'package:electroline/screens/details/components/cart_screen.dart';
import 'package:electroline/screens/details/components/favourite.dart';
import 'package:electroline/screens/home/hpage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:electroline/screens/home/Homepage.dart';
import 'models/cpage.dart';
import 'models/fpage.dart';
import 'models/product.dart';
import 'models/settings.dart';
import 'screens/product-view.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;
void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  await Firebase.initializeApp(
    name: 'firebase',
    options: DefaultFirebaseOptions.currentPlatform,
  );
  //firestoreSend();
  firestoreGets();
  //sendData();
  //getData();
  runApp(const MyApp());
  FlutterNativeSplash.remove();
}

class MyApp extends StatefulWidget {
  const MyApp({
    Key? key,
  }) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData.light(),
        debugShowCheckedModeBanner: false,
        home: MyHomePage(),
        routes: {
          '0': (context) => MyHomePage(),
          '1': (context) => fave(),
          '2': (context) => cart(),
          '3': (context) => settings(auth: _auth),
          '4': (context) => account(auth: _auth,),
          '5': (context) => sout(auth: _auth),
          //'6': (context) => fpage(context: context, Cindex: 1),
          //'7': (context) => cpage(context: context, Cindex: 2),

        });
  }
}
