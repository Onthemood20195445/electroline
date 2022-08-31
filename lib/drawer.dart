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
      backgroundColor: Colors.black,
      child: ListView(
        children: <Widget>[
          DrawerHeader(
              child: Text(
                "Build your dream PC :)",
                style: TextStyle(color: Colors.red[900], fontSize: 30),
              )),
          ListTile(
            title: Text(
              'Graphics Card',
              style: TextStyle(color: Colors.red[900]),
            ),
            trailing:
            Icon(Icons.arrow_forward_ios, color: Colors.red[900]),
          ),
          ListTile(
            title: Text(
              'CPUs',
              style: TextStyle(color: Colors.red[900]),
            ),
            trailing:
            Icon(Icons.arrow_forward_ios, color: Colors.red[900]),
          ),
          ListTile(
            title: Text(
              'Motherboards',
              style: TextStyle(color: Colors.red[900]),
            ),
            trailing:
            Icon(Icons.arrow_forward_ios, color: Colors.red[900]),
          ),
          ListTile(
            title: Text(
              'Meomery',
              style: TextStyle(color: Colors.red[900]),
            ),
            trailing:
            Icon(Icons.arrow_forward_ios, color: Colors.red[900]),
          ),
          ListTile(
            title: Text(
              'Power supplies',
              style: TextStyle(color: Colors.red[900]),
            ),
            trailing:
            Icon(Icons.arrow_forward_ios, color: Colors.red[900]),
          ),
          ListTile(
            title: Text(
              'Cases',
              style: TextStyle(color: Colors.red[900]),
            ),
            trailing:
            Icon(Icons.arrow_forward_ios, color: Colors.red[900]),
          ),
          ListTile(
            title: Text(
              'Fans & Cooling Components',
              style: TextStyle(color: Colors.red[900]),
            ),
            trailing:
            Icon(Icons.arrow_forward_ios, color: Colors.red[900]),
          ),
          ListTile(
            title: Text(
              'Accesories',
              style: TextStyle(color: Colors.red[900]),
            ),
            trailing:
            Icon(Icons.arrow_forward_ios, color: Colors.red[900]),
          )
        ],
      ),
    );
  }
}
