import 'package:electroline/bottomNavigationBar.dart';
import 'package:electroline/models/product.dart';
import 'package:electroline/screens/details/components/body.dart';
import 'package:flutter/material.dart';
import 'package:electroline/bottomNavigationBar.dart';

import '../../../drawer.dart';
import '../details_screen.dart';

List<Product> favo = [];

class fave extends StatefulWidget {
  const fave({Key? key}) : super(key: key);

  @override
  State<fave> createState() => _faveState();
}

class _faveState extends State<fave> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          elevation: 0,
          title: Text('Favourite',
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
            return GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DetailsScreen(
                        product: products[index],
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
        bottomNavigationBar: bottomBar(context: context, Cindex: 1));
  }
}
