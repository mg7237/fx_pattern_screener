import 'package:flutter/material.dart';
import 'package:fx_screener/screens/webview.dart';
import 'package:fx_screener/util/notifications_data.dart';

class AppDrawer extends StatefulWidget {
  const AppDrawer({Key? key}) : super(key: key);

  @override
  _AppDrawerState createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> {
  int stateflag = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Drawer(
            child: ListView(children: [
      if (stateflag == 0)
        Container(
          height: 80,
          margin: EdgeInsets.only(bottom: 10),
          padding: EdgeInsets.only(top: 20, left: 20, bottom: 10),
          decoration: BoxDecoration(color: Theme.of(context).primaryColor),
          child: Text(
            'Fx Screener',
            style: TextStyle(
                fontSize: 25,
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontFamily: 'Poppins'),
          ),
        ),
      if (stateflag == 1)
        Container(
          height: 60,
          padding: EdgeInsets.only(top: 15, left: 10),
          decoration: BoxDecoration(color: Theme.of(context).primaryColor),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                child: Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: Icon(
                    Icons.arrow_back_ios,
                    color: Colors.white,
                    size: 20,
                  ),
                ),
                onTap: () {
                  setState(() {
                    stateflag = 0;
                  });
                },
              ),
              SizedBox(width: 15),
              Text(
                'Alert Setting',
                style: TextStyle(
                    fontSize: 25,
                    fontFamily: 'Poppins',
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      if (stateflag == 0)
        Column(
          children: [
            GestureDetector(
              child: Container(
                  width: 300,
                  padding: EdgeInsets.only(top: 30, left: 20, bottom: 5),
                  child: Row(
                    children: [
                      Icon(Icons.notifications),
                      Text(
                        ' Alert Setting',
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 18,
                        ),
                      ),
                    ],
                  )),
              onTap: () {
                setState(() {
                  stateflag = 1;
                });
              },
            ),
            GestureDetector(
              child: Container(
                  padding: EdgeInsets.only(top: 30, left: 20),
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
            GestureDetector(
              child: Container(
                  padding: EdgeInsets.only(top: 30, left: 20),
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
            GestureDetector(
              child: Container(
                  padding: EdgeInsets.only(top: 30, left: 20),
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
            GestureDetector(
              child: Container(
                  padding: EdgeInsets.only(top: 30, left: 20),
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
      if (stateflag == 1)
        Column(
          children: [
            //title
            GestureDetector(
              onTap: () {
                if (notification_time[0] == true)
                  for (int i = 1; i < 11; i++) {
                    setState(() {
                      notification_time[0] = false;
                      notification_time[i] = false;
                      Map<String, String> register_data = {
                        "register_token": fcmtoken,
                        "time": i.toString(),
                        'enable': "0"
                      };
                      // ApiHelper.postRegister(register_data);
                      // Datafilemanage.save_notification_time();
                    });
                  }
              },
              //show notification
              child: Container(
                margin: EdgeInsets.only(bottom: 10),
                height: 40,
                decoration: BoxDecoration(color: Theme.of(context).accentColor),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Positioned(
                      left: 40,
                      child: Text(
                        "Show Alert",
                        style: TextStyle(
                            fontSize: 17,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Poppins'),
                      ),
                    ),
                    Positioned(
                        right: 20,
                        child: Switch(
                          value: notification_time[0],
                          onChanged: (value) {
                            if (value == false)
                              for (int i = 1; i < 11; i++) {
                                setState(() {
                                  notification_time[0] = false;
                                  notification_time[i] = false;
                                  Map<String, String> register_data = {
                                    "register_token": fcmtoken,
                                    "time": i.toString(),
                                    'enable': "0"
                                  };
                                  // ApiHelper.postRegister(register_data);
                                  // Datafilemanage.save_notification_time();
                                });
                              }
                          },
                        ))
                  ],
                ),
              ),
            ),
            //timeset
            SizedBox(
              height: 10,
            ),
            for (int i = 1; i < 11; i++)
              GestureDetector(
                onTap: () {
                  notification_time[i] = !notification_time[i];
                  if (notification_time[i] == true)
                    setState(() {
                      notification_time[0] = true;
                      Map<String, String> register_data = {
                        "register_token": fcmtoken,
                        "time": i.toString(),
                        'enable': "1"
                      };
                      // ApiHelper.postRegister(register_data);
                      // Datafilemanage.save_notification_time();
                    });
                  else {
                    int fflag = 0;
                    for (int j = 1; j < 11; j++) {
                      if (notification_time[j] == true) fflag = 1;
                    }
                    if (fflag == 0) notification_time[0] = false;
                    setState(() {
                      Map<String, String> register_data = {
                        "register_token": fcmtoken,
                        "time": i.toString(),
                        'enable': "0"
                      };
                      // ApiHelper.postRegister(register_data);
                      // Datafilemanage.save_notification_time();
                    });
                  }
                },
                child: Container(
                  height: 40,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Positioned(
                        left: 40,
                        child: Text(
                          notificationtimename_1[i],
                          style: TextStyle(
                              fontSize: 17, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Positioned(
                          right: 20,
                          child: Switch(
                            value: notification_time[i],
                            onChanged: (value) {
                              if (value == true)
                                setState(() {
                                  notification_time[0] = true;
                                  notification_time[i] = true;
                                  Map<String, String> register_data = {
                                    "register_token": fcmtoken,
                                    "time": i.toString(),
                                    'enable': "1"
                                  };
                                  // ApiHelper.postRegister(register_data);
                                  // Datafilemanage.save_notification_time();
                                });
                              else {
                                setState(() {
                                  notification_time[i] = false;
                                  int fflag = 0;
                                  for (int j = 1; j < 11; j++) {
                                    if (notification_time[j] == true) fflag = 1;
                                  }
                                  if (fflag == 0) notification_time[0] = false;
                                  Map<String, String> register_data = {
                                    "register_token": fcmtoken,
                                    "time": i.toString(),
                                    'enable': "0"
                                  };
                                  // ApiHelper.postRegister(register_data);
                                  // Datafilemanage.save_notification_time();
                                });
                              }
                            },
                          ))
                    ],
                  ),
                ),
              ),
            SizedBox(
              height: 10,
            ),
          ],
        ),
    ])));
  }
}
