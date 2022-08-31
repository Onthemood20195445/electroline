import 'package:electroline/screens/details/components/favourite.dart';
import 'package:electroline/screens/details/components/product_info.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:favorite_button/favorite_button.dart';

import '../../../models/product.dart';
import 'add_to_cart.dart';
import 'cart_counter.dart';

Color iconColor = Colors.grey;
bool col = false;

class Body extends StatelessWidget {
  final Product product;

  const Body({Key? key, required this.product}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // It provide us total height and width
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          SizedBox(
            height: size.height,
            child: Stack(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(top: size.height * 0.3),
                  padding: EdgeInsets.only(
                    top: size.height * 0.12,
                    left: 20,
                    right: 20,
                  ),
                  // height: 500,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(24),
                      topRight: Radius.circular(24),
                    ),
                  ),
                  child: Column(
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          CartCounter(),
                          IconButton(
                            icon: Icon(Icons.favorite),
                            color: iconColor,
                            tooltip: 'Add to favorite',
                            onPressed: () {
                              if (iconColor == Colors.grey) {
                                iconColor = Colors.red;
                                favo.add(product);
                              } else {
                                iconColor = Colors.grey;
                                favo.remove(product);
                              }
                            },
                          ),
                          /*FavoriteButton(
                            isFavorite: col,
                            iconDisabledColor: Colors.black,
                            valueChanged: (bool ca) {
                              ca=col;
                              if(ca==false){
                              favo.add(product);}
                              else{favo.remove(product);}
                            },
                          ),*/
                        ],
                      ),
                      SizedBox(height: 20 / 2),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 20),
                        child: Text(
                          product.description,
                          style: TextStyle(height: 1.5),
                        ),
                      ),
                      //AddToCart(product: product),
                    ],
                  ),
                ),
                ProductTitleWithImage(product: product),
              ],
            ),
          )
        ],
      ),
    );
  }
}
