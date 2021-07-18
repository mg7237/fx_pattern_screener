import 'package:flutter/material.dart';
import 'package:fx_screener/screens/webview.dart';
import 'package:fx_screener/screens/subscription.dart';

class AppDrawer extends StatefulWidget {
  const AppDrawer({Key? key}) : super(key: key);

  @override
  _AppDrawerState createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> {
  bool _alert = false;
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Drawer(
            child: ListView(children: [
      Container(
        height: 80,
        margin: EdgeInsets.only(bottom: 10),
        padding: EdgeInsets.only(top: 20, left: 20, bottom: 10),
        decoration: BoxDecoration(color: Theme.of(context).primaryColor),
        child: Text(
          'Fx Pattern Screener',
          style: TextStyle(
              fontSize: 23,
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontFamily: 'Poppins'),
        ),
      ),
      Column(
        children: [
          Container(
              width: 300,
              padding: EdgeInsets.only(top: 10, left: 20, bottom: 5, right: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(children: [
                    Icon(Icons.notifications),
                    Text(
                      ' Notifications',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 18,
                      ),
                    )
                  ]),
                  Switch(
                      value: _alert,
                      onChanged: (value) {
                        setState(() {
                          _alert = value;
                        });
                      })
                ],
              )),
          const Divider(
            height: 20,
            thickness: 1,
            indent: 20,
            endIndent: 20,
          ),
          GestureDetector(
            child: Container(
                padding: EdgeInsets.only(top: 10, left: 20),
                child: Row(
                  children: [
                    Icon(Icons.shopping_cart),
                    Text(
                      ' Buy Subscription',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 18,
                      ),
                    ),
                  ],
                )),
            onTap: () {
              Navigator.pop(context);
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => SubscriptionPage()));
            },
          ),
          const Divider(
            height: 20,
            thickness: 1,
            indent: 20,
            endIndent: 20,
          ),
          GestureDetector(
            child: Container(
                padding: EdgeInsets.only(top: 10, left: 20),
                child: Row(
                  children: [
                    Icon(Icons.near_me),
                    Text(
                      ' Support',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 18,
                      ),
                    ),
                  ],
                )),
            onTap: () {
              Navigator.pop(context);
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => WebviewPage(
                        url: "http://zapp.fxsonic.com/support/view",
                        title: 'Support',
                      )));
            },
          ),
          const Divider(
            height: 20,
            thickness: 1,
            indent: 20,
            endIndent: 20,
          ),
          GestureDetector(
            child: Container(
                padding: EdgeInsets.only(top: 10, left: 20),
                child: Row(
                  children: [
                    Icon(Icons.business),
                    Text(
                      ' About us',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 18,
                      ),
                    ),
                  ],
                )),
            onTap: () {
              Navigator.pop(context);
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => WebviewPage(
                        url: "http://zapp.fxsonic.com/about/view",
                        title: 'About Us',
                      )));
            },
          ),
          const Divider(
            height: 20,
            thickness: 1,
            indent: 20,
            endIndent: 20,
          ),
          GestureDetector(
            child: Container(
                padding: EdgeInsets.only(top: 10, left: 20),
                child: Row(
                  children: [
                    Icon(Icons.receipt_long),
                    Text(
                      ' Terms & Conditions',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 18,
                      ),
                    ),
                  ],
                )),
            onTap: () {
              Navigator.pop(context);
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => WebviewPage(
                        url: "http://zapp.fxsonic.com/term/view",
                        title: 'Terms & Conditions',
                      )));
            },
          ),
          const Divider(
            height: 20,
            thickness: 1,
            indent: 20,
            endIndent: 20,
          ),
          GestureDetector(
            child: Container(
                padding: EdgeInsets.only(top: 10, left: 20),
                child: Row(
                  children: [
                    Icon(Icons.privacy_tip),
                    Text(
                      ' Privacy Policy',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 18,
                      ),
                    ),
                  ],
                )),
            onTap: () {
              Navigator.pop(context);
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => WebviewPage(
                        url: "http://zapp.fxsonic.com/privacy/view",
                        title: 'Privacy Policy',
                      )));
            },
          ),
        ],
      ),
    ])));
  }
}
