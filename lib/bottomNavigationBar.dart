import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class bottomBar extends StatefulWidget {
  int Cindex;
  BuildContext context;
  bottomBar({Key? key, required this.context, required this.Cindex})
      : super(key: key);

  @override
  State<bottomBar> createState() => _bottomBarState();
}

class _bottomBarState extends State<bottomBar> {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      items: [
        BottomNavigationBarItem(label: 'Home', icon: Icon(Icons.home)),
        BottomNavigationBarItem(
            label: 'Favourite', icon: FaIcon(FontAwesomeIcons.heart)),
        BottomNavigationBarItem(label: 'Cart', icon: Icon(Icons.shopping_cart)),
        BottomNavigationBarItem(label: 'Settings', icon: Icon(Icons.settings))
      ],
      currentIndex: widget.Cindex,
      unselectedItemColor: Colors.black,
      selectedItemColor: Colors.white,
      backgroundColor: Colors.red[900],
      onTap: (int index) {
        setState(() {
          this.widget.Cindex = index;
          if (index == 0) {
            Navigator.pushNamed(widget.context, "0");
          } else if (index == 1) {
            this.widget.Cindex = 0;
            Navigator.pushNamed(widget.context, "1");
          } else if (index == 2) {
            this.widget.Cindex = 0;
            Navigator.pushNamed(widget.context, "2");
          } else if (index == 3) {
            Navigator.pushNamed(widget.context, "3");
          }
        });
      },
    );
  }
}
