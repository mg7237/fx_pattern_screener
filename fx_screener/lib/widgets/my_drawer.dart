import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  _showNotification() {}

  _support() {}

  _purchase() {
//  Navigator.of(context).pop();
//     Navigator.of(context).push(MaterialPageRoute(
//         builder: (context) => WebPage('Terms & Conditions',
//             'https://www.easyleases.in/terms-and-condition')));
  }

  _about() {}

  _rateUs() {}

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        physics: BouncingScrollPhysics(),
        children: <Widget>[
          ListTile(
            title: Text("Notification"),
            onTap: () => _showNotification(),
          ),
          Container(
            height: 1,
            color: Colors.grey[200],
          ),
          ListTile(
            title: Text("Purchase"),
            onTap: () => _purchase(),
          ),
          Container(
            height: 1,
            color: Colors.grey[200],
          ),
          ListTile(
            title: Text("Support"),
            onTap: () => _support(),
          ),
          Container(
            height: 1,
            color: Colors.grey[200],
          ),
          ListTile(
            title: Text("About Us"),
            onTap: () => _about(),
          ),
          Container(
            height: 1,
            color: Colors.grey[200],
          ),
          ListTile(
            title: Text("Rate Us"),
            onTap: () => _rateUs(),
          ),
        ],
      ),
    );
  }
}
