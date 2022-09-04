import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:electroline/models/product.dart';
import 'package:electroline/screens/home/Homepage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../bottomNavigationBar.dart';
import '../../../drawer.dart';
import '../../../models/product.dart';
import '../details_screen.dart';

List<Product> carts = [];
List<int> quan = [];





class cart extends StatefulWidget {
  final FirebaseAuth auth;
  const cart({Key? key,required this.auth}) : super(key: key);

  @override
  State<cart> createState() => _cartState();
}

class _cartState extends State<cart> {
  void showAlertDialog(BuildContext context) {
    var alertDialog = CupertinoAlertDialog(
      title: Text(
        'Confirmation message',
        style: TextStyle(color: Colors.black),
      ),
      content: Text(
        'are you sure you want to proceed',
        style: TextStyle(fontSize: 15),
      ),
      actions: [
        ElevatedButton(
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.blueGrey)),
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text("Cancel", style: TextStyle(color: Colors.white))),
        ElevatedButton(
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.black)),
            onPressed: () {
              setState(() {
                widget.auth.authStateChanges().listen((User? user) async {
                  if (user == null) {
                    print('User is currently signed out!');
                    nosign(context);
                  } else {
                    print('User is signed in!');
                    send(widget.auth, carts.toList().toString(), quan.toList().toString());
                    carts.clear();
                    quan.clear();
                    order(context);
                  }
                });
              });
            },
            child: Text("Confirm", style: TextStyle(color: Colors.white))),
      ],
    );
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return alertDialog;
        });
  }

  void nosign(BuildContext context) {
    var alertDialog = CupertinoAlertDialog(
      title: Text(
        'Error message',
        style: TextStyle(color: Colors.black),
      ),
      content: Text(
        ' you need to sign in first ',
        style: TextStyle(fontSize: 15),
      ),
      actions: [
        ElevatedButton(
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.blueGrey)),
            onPressed: () {
              Navigator.pop(context);
              Navigator.pop(context);
            },
            child: Text("okay", style: TextStyle(color: Colors.white))),

      ],
    );
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return alertDialog;
        });
  }

  void order(BuildContext context) {
    var alertDialog = CupertinoAlertDialog(
      title: Text(
        'Order placed',
        style: TextStyle(color: Colors.black),
      ),
      content: Text(
        'please visit our store after 2 hours',
        style: TextStyle(fontSize: 15),
      ),
      actions: [
        ElevatedButton(
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.black)),
            onPressed: () {
              Navigator.pop(context);
              Navigator.pop(context);
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MyHomePage(),
                  ));
            },
            child: Text("Continue shoping",
                style: TextStyle(color: Colors.white))),
      ],
    );
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return alertDialog;
        });
  }

  void empty(BuildContext context) {
    var alertDialog = CupertinoAlertDialog(
      title: Text(
        'Error',
        style: TextStyle(color: Colors.black),
      ),
      content: Text(
        'Cart is empty',
        style: TextStyle(fontSize: 15),
      ),
      actions: [
        ElevatedButton(
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.black)),
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text("Ok", style: TextStyle(color: Colors.white))),
      ],
    );
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return alertDialog;
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(automaticallyImplyLeading: false,
        actions: [
          IconButton(
              onPressed: () {
                if (carts.length == 0 || quan.length == 0) {
                  empty(context);
                } else {
                  showAlertDialog(context);
                }
              },
              icon: Icon(Icons.shopping_cart_checkout_outlined,color: Colors.white,))
        ],


        centerTitle: true,
        elevation: 0,
        title: Text('Cart',
            style: TextStyle(
                color: Colors.white,
                fontFamily: 'GreatVibes',
                fontWeight: FontWeight.bold,
                fontSize: 30)),
        backgroundColor: Colors.red[900],

      ),
      body: ListView.builder(
        itemBuilder: (BuildContext context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetailsScreen(
                      product: products[products.indexOf(carts[index])],
                    ),
                  ));
            },
            child: Card(
              child: ListTile(
                  leading: Text('x${quan[index].toString()}'),
                  title: FittedBox(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(carts[index].title),
                        Text('\$${carts[index].price.toString()}'),
                      ],
                    ),
                  ),
                  trailing: IconButton(
                      onPressed: () {
                        setState(() {
                          carts.removeAt(index);
                          quan.removeAt(index);
                        });
                      },
                      icon: Icon(Icons.close))),

            ),
          );
        },
        itemCount: carts.length,
        shrinkWrap: true,
        padding: EdgeInsets.all(5),
        scrollDirection: Axis.vertical,
      ),
      bottomNavigationBar:bottomBar(context: context, Cindex: 2) ,
    );
  }
}
