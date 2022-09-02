import 'package:electroline/bottomNavigationBar.dart';
import 'package:electroline/models/product.dart';
import 'package:electroline/screens/details/components/body.dart';
import 'package:flutter/material.dart';
import 'package:electroline/bottomNavigationBar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../drawer.dart';
import '../screens/details/details_screen.dart';


List<Product> favo = [];

class fpage extends StatefulWidget {
  int Cindex;
  BuildContext context;
  fpage({Key? key, required this.context, required this.Cindex}) : super(key: key);

  @override
  State<fpage> createState() => _fpageState();
}

class _fpageState extends State<fpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(automaticallyImplyLeading: false,
          centerTitle: true,
          elevation: 0,
          title: Text('Favourite',
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
                        product: products[products.indexOf(favo[index])],
                      ),
                    ));
              },
              child: Card(
                child: ListTile(
                    leading: Image(
                      image: AssetImage(favo[index].image),
                    ),
                    title: FittedBox(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(favo[index].title),
                          //Text('\$${favo[index].price.toString()}'),
                        ],
                      ),
                    ),
                    trailing: IconButton(
                        onPressed: () {
                          setState(() {
                            favo.removeAt(index);
                            iconColor = Colors.grey;
                          });
                        },
                        icon: Icon(Icons.close))),
              ),
            );
          },
          itemCount: favo.length,
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
