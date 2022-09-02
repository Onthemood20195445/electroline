import 'dart:collection';

import 'package:electroline/drawer.dart';
import 'package:electroline/bottomNavigationBar.dart';
import 'package:flutter/material.dart';
import 'package:electroline/models/product.dart';
import 'package:electroline/models/item_card.dart';

import 'details/details_screen.dart';

class ProductView extends StatefulWidget {
  final String categories;
  ProductView({Key? key, required this.categories}) : super(key: key);
  @override
  State<ProductView> createState() => ProductViewState();
}

class ProductViewState extends State<ProductView> {
  int _index = 0;
  late List<int> __index;
  @override
  void initState() {
    super.initState();

    ListProductsFullData()async {
      try  {
        List<int> index=[];
        if (widget.categories != "all") {
          List<Product> list =  products
              .where((element) => element.categories == widget.categories)
              .toList();
          for(int i=0;i<list.length;i++){
            index.add(products.indexOf(list[i]));
          }
          __index=index;
        } else {
          for(int i=0;i<products.length;i++){
            index.add(products.indexOf(products[i]));
          }
          __index=index;
        }
      } catch (e) {
        print(e);
      }
    }
    ListProductsFullData();


  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(widget.categories,
            style: const TextStyle(
                color: Colors.black,
                fontFamily: 'GreatVibes',
                fontWeight: FontWeight.bold,
                fontSize: 35)),
        backgroundColor: Colors.red[900],
      ),
      drawer: const appdrawer(),
      body: Center(
        child: Column(
          children: [
            Expanded(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                child: GridView.builder(
                    itemCount: __index.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 20,
                      crossAxisSpacing: 20,
                      childAspectRatio: 0.75,
                    ),
                    itemBuilder: (context, index) => ItemCard(
                          product: products[__index[index]],
                          press: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => DetailsScreen(
                                  product: products[__index[index]],
                                ),
                              )),
                        )),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: bottomBar(Cindex: _index, context: context),
    );
  }
}
