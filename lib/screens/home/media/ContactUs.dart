import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'SocialMedia.dart';

class ContactUs extends StatelessWidget {
  const ContactUs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
          child: Column(children: [
        Text(
          'Our Contact Channels',
          style: TextStyle(
              fontSize: 30, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        ListTile(
          leading: Icon(Icons.phone_in_talk, color: Colors.green),
          title: Text(
            'Call 000',
            style: TextStyle(
                fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
          ),
        ),
        ListTile(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      SocialMedia(link: "https://mail.google.com/"),
                ));
          },
          leading: Icon(Icons.email_rounded, color: Colors.white),
          title: Text(
            'Electroline_care@el.eg',
            style: TextStyle(
                fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
          ),
        ),
        ListTile(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      SocialMedia(link: "https://www.youtube.com/"),
                ));
          },
          leading: FaIcon(FontAwesomeIcons.youtube, color: Colors.red),
          title: Text(
            'Youtube',
            style: TextStyle(
                fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
          ),
        ),
        ListTile(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      SocialMedia(link: "https://www.facebook.com/"),
                ));
          },
          leading:
              FaIcon(FontAwesomeIcons.facebookSquare, color: Colors.blueAccent),
          title: Text(
            'Facebook',
            style: TextStyle(
                fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
          ),
        )
      ])),
    );
  }
}
