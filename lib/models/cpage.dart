import 'package:electroline/models/product.dart';
import 'package:electroline/screens/home/Homepage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../drawer.dart';

import '../screens/details/details_screen.dart';

List<Product> carts = [];
List<int> quan = [];

class cpage extends StatefulWidget {
  int Cindex;
  BuildContext context;
  cpage({Key? key, required this.context, required this.Cindex})
      : super(key: key);

  @override
  State<cpage> createState() => _cpageState();
}

class _cpageState extends State<cpage> {
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
                carts.clear();
                quan.clear();
                order(context);
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
        appBar: AppBar(
          automaticallyImplyLeading: false,
          actions: [
            IconButton(
                onPressed: () {
                  if (carts.length == 0 || quan.length == 0) {
                    empty(context);
                  } else {
                    showAlertDialog(context);
                  }
                },
                icon: Icon(Icons.shopping_cart_checkout_outlined,color: Colors.black,))
          ],
          centerTitle: true,
          elevation: 0,
          title: Text('Cart',
              style: TextStyle(
                  color: Colors.black,
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
