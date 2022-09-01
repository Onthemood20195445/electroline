import 'package:electroline/models/product.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../drawer.dart';
import '../details_screen.dart';

List<Product> carts = [];
List<int> quan = [];

class cart extends StatefulWidget {
  const cart({Key? key}) : super(key: key);

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
                backgroundColor:
                MaterialStateProperty.all(Colors.blueGrey)),
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text("Cancel", style: TextStyle(color: Colors.white))),
        ElevatedButton(
            style: ButtonStyle(
                backgroundColor:
                MaterialStateProperty.all(Colors.black)),
            onPressed: () {
              Navigator.pop(context);
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


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        title: Text('Cart',
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
      body: ListView.builder(
        itemBuilder: (BuildContext context, index) {
          return GestureDetector(onTap: (){
            Navigator.push( context,
                MaterialPageRoute(
                builder: (context) => DetailsScreen(
              product: products[index],
            ),));
          },
            child: Card(


              child: ListTile(
                  leading: Text('x${quan[index].toString()}'),
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(carts[index].title),
                      Text('\$${carts[index].price.toString()}'),
                    ],
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
      bottomNavigationBar: TextButton(
        onPressed: () {
        showAlertDialog(context);
        },
        style: ButtonStyle(
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18.0),
                  side: BorderSide(color: Colors.white))),
          backgroundColor:
              MaterialStateColor.resolveWith((states) => Colors.red.shade900),
        ),
        child: Text(
          "Check out".toUpperCase(),
          style: TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
