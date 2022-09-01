import 'package:electroline/screens/product-view.dart';
import 'package:flutter/material.dart';

class appdrawer extends StatefulWidget {
  const appdrawer({Key? key}) : super(key: key);

  @override
  State<appdrawer> createState() => _appdrawerState();
}

class _appdrawerState extends State<appdrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: 200,
      //backgroundColor: Colors.black,
      child: ListView(
        children: <Widget>[
          DrawerHeader(
              child: Text(
            "Build your dream PC :)",
            style: TextStyle(color: Colors.red[900], fontSize: 30),
          )),
          ListTile(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProductView(categories: "gpu"),
                  ));
            },
            title: Text(
              'Graphics Card',
              style: TextStyle(color: Colors.red[900]),
            ),
            trailing: Icon(Icons.arrow_forward_ios, color: Colors.red[900]),
          ),
          ListTile(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProductView(categories: "cpu"),
                  ));
            },
            title: Text(
              'CPUs',
              style: TextStyle(color: Colors.red[900]),
            ),
            trailing: Icon(Icons.arrow_forward_ios, color: Colors.red[900]),
          ),
          ListTile(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        ProductView(categories: "motherboards"),
                  ));
            },
            title: Text(
              'Motherboards',
              style: TextStyle(color: Colors.red[900]),
            ),
            trailing: Icon(Icons.arrow_forward_ios, color: Colors.red[900]),
          ),
          ListTile(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProductView(categories: "memory"),
                  ));
            },
            title: Text(
              'Memory',
              style: TextStyle(color: Colors.red[900]),
            ),
            trailing: Icon(Icons.arrow_forward_ios, color: Colors.red[900]),
          ),
          ListTile(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProductView(categories: "power"),
                  ));
            },
            title: Text(
              'Power supplies',
              style: TextStyle(color: Colors.red[900]),
            ),
            trailing: Icon(Icons.arrow_forward_ios, color: Colors.red[900]),
          ),
          ListTile(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProductView(categories: "cases"),
                  ));
            },
            title: Text(
              'Cases',
              style: TextStyle(color: Colors.red[900]),
            ),
            trailing: Icon(Icons.arrow_forward_ios, color: Colors.red[900]),
          ),
          ListTile(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProductView(categories: "cooling"),
                  ));
            },
            title: Text(
              'Fans & Cooling Components',
              style: TextStyle(color: Colors.red[900]),
            ),
            trailing: Icon(Icons.arrow_forward_ios, color: Colors.red[900]),
          ),
          ListTile(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProductView(categories: "accesories"),
                  ));
            },
            title: Text(
              'Accesories',
              style: TextStyle(color: Colors.red[900]),
            ),
            trailing: Icon(Icons.arrow_forward_ios, color: Colors.red[900]),
          )
        ],
      ),
    );
  }
}
