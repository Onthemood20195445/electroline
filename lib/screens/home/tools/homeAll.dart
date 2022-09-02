import 'package:electroline/screens/home/tools/imageSlider.dart';
import 'package:flutter/material.dart';

import '../../../models/product.dart';
import '../../product-view.dart';

class homeAll extends StatefulWidget {
  const homeAll({Key? key}) : super(key: key);

  @override
  State<homeAll> createState() => _homeAllState();
}

class _homeAllState extends State<homeAll> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          imageSlider(),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: GridView.builder(
                //shrinkWrap: true,
                itemCount: categories.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                  childAspectRatio: 1.10,
                ),
                itemBuilder: (context, index) => GestureDetector(
                    onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ProductView(
                            categories: categories[index].name.toLowerCase(),
                          ),
                        )),
                    child: Container(
                      child: Center(
                        child: Column(
                          children: [
                            Image.asset(
                              categories[index].image,
                              width: 200,
                              height: 120,
                            ),
                            Text(
                              categories[index].name.toUpperCase(),
                              style: TextStyle(
                                fontSize: 18,
                                fontFamily: "Times",
                                color: Colors.red[900],
                              ),
                            ),
                          ],
                        ),
                      ),
                      color: Colors.black,
                    )),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
