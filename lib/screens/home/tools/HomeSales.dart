import 'package:electroline/screens/product-view.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomeSales extends StatefulWidget {
  const HomeSales({Key? key}) : super(key: key);

  @override
  State<HomeSales> createState() => _HomeSalesState();
}

class _HomeSalesState extends State<HomeSales> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Coming Soon! ',
            style: TextStyle(
                fontSize: 60,
                fontFamily: 'Greatvibes',
                fontWeight: FontWeight.bold),
          ),
          IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ProductView(categories: 'all'),
                    ));
              },
              icon: FaIcon(FontAwesomeIcons.gift))
        ],
      )),
    );
  }
}
