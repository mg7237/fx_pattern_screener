import 'package:flutter/material.dart';
import 'package:fx_screener/screens/home.dart';

class SubscriptionPage extends StatefulWidget {
  SubscriptionPage();

  @override
  _SubscriptionPageState createState() => _SubscriptionPageState();
}

class _SubscriptionPageState extends State<SubscriptionPage> {
  bool ipad = false;
  List<Color> _listColors = [];
  @override
  void initState() {
    super.initState();
    _listColors = [
      Colors.grey[700]!,
      Colors.grey[900]!,
      Colors.grey[700]!,
    ];
    isIpad();
  }

  Future<void> isIpad() async {
    // DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    // IosDeviceInfo info = await deviceInfo.iosInfo;
    // if (info.model.toLowerCase().contains("ipad")) {
    //   setState(() {
    //     ipad = true;
    //   });
    // }
    return;
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
          color: Color(0xffF7F8FB),
          padding: EdgeInsets.only(
              top: 80, left: ipad ? 25 : 15, right: ipad ? 25 : 15),
          child: Column(children: [
            Row(
              children: [
                Container(
                    height: 25,
                    width: 25,
                    child: Image(
                        image: AssetImage(
                            'assets/icons/success-green-check-mark.png'))),
                SizedBox(width: ipad ? 20 : 10),
                Text("No Ads",
                    style: TextStyle(
                      fontSize: ipad ? 15 : 16,
                      color: Colors.grey[600],
                      fontFamily: "Poppins",
                    ))
              ],
            ),
            SizedBox(height: 10),
            Row(
              children: [
                Container(
                    height: 25,
                    width: 25,
                    child: Image(
                        image: AssetImage(
                            'assets/icons/success-green-check-mark.png'))),
                SizedBox(width: ipad ? 20 : 10),
                Text("Full access to all features",
                    style: TextStyle(
                      fontSize: ipad ? 15 : 16,
                      color: Colors.grey[600],
                      fontFamily: "Poppins",
                    ))
              ],
            ),
            SizedBox(height: 10),
            Row(
              children: [
                Container(
                    height: 25,
                    width: 25,
                    child: Image(
                        image: AssetImage(
                            'assets/icons/success-green-check-mark.png'))),
                SizedBox(width: ipad ? 20 : 10),
                Text("Fx Pattern Screener",
                    style: TextStyle(
                      fontSize: ipad ? 15 : 16,
                      color: Colors.grey[600],
                      fontFamily: "Poppins",
                    ))
              ],
            ),
            SizedBox(height: 10),
            Row(
              children: [
                Container(
                    height: 25,
                    width: 25,
                    child: Image(
                        image: AssetImage(
                            'assets/icons/success-green-check-mark.png'))),
                SizedBox(width: ipad ? 20 : 10),
                Text("Monitoring currency fluctuation",
                    style: TextStyle(
                      fontSize: ipad ? 15 : 16,
                      color: Colors.grey[600],
                      fontFamily: "Poppins",
                    ))
              ],
            ),
            SizedBox(height: 10),
            Row(
              children: [
                Container(
                    height: 25,
                    width: 25,
                    child: Image(
                        image: AssetImage(
                            'assets/icons/success-green-check-mark.png'))),
                SizedBox(width: ipad ? 20 : 10),
                Text("Customizable Notifications",
                    style: TextStyle(
                      fontSize: ipad ? 15 : 16,
                      color: Colors.grey[600],
                      fontFamily: "Poppins",
                    ))
              ],
            ),
            SizedBox(
              height: ipad ? 55 : 45,
            ),
            Text(
              'Get 7-Day Free Trial',
              style: TextStyle(
                fontFamily: "Poppins",
                fontSize: 20 * MediaQuery.of(context).size.width / 390,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 15,
            ),
            InkWell(
              child: Container(
                  child: Text(
                    'Subscribe',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 28 * MediaQuery.of(context).size.width / 390,
                        letterSpacing: 1),
                  ),
                  padding:
                      EdgeInsets.only(left: 50, right: 50, top: 8, bottom: 8),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      gradient: LinearGradient(
                          colors: _listColors,
                          stops: [0.1, 0.5, 0.9],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter))),
              onTap: () async {
                //widget.purchase();
              },
            ),
            SizedBox(
              height: 15,
            ),
            Text(
              "Then \$9.99 USD/Month",
              style: TextStyle(
                fontFamily: "Poppins",
                fontSize: 20 * MediaQuery.of(context).size.width / 390,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 40),
            GestureDetector(
              onTap: () async {
                // if (widget.isSubscriptionActive) {
                print("True");
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => HomePage()));
              }
              //   // } else {
              //     print("False");
              //     AlertDialog(
              //       elevation: 10,
              //       shape: RoundedRectangleBorder(
              //           borderRadius: BorderRadius.all(Radius.circular(20.0))),
              //       title: Text("NO_SUBSCRIPTION"),
              //       content: Text(
              //           "Invalid subscription, please subscribe to get access to the APP content"),
              //     );
              //   }
              // },
              ,
              child: Text("Restore Purchases",
                  style: TextStyle(
                      color: Colors.blue,
                      fontSize: ipad
                          ? 13 * MediaQuery.of(context).size.width / 390
                          : 15 * MediaQuery.of(context).size.width / 390,
                      letterSpacing: 0.1)),
            ),
            SizedBox(
              height: ipad ? 50 : 30,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Center(
                child: Text(
                  "After 7 days free trial, payment will be charged \$9.99 USD automatically each month to your Apple ID account unless it is cancelled no later than 24 hours prior to the renewal date. You can cancel automatic renewal or manage your subscription anytime by going to your Account Settings on the App Store.",
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                    fontFamily: "Poppins",
                    color: Colors.grey[600],
                    fontSize: ipad
                        ? 11 * MediaQuery.of(context).size.width / 390
                        : 12 * MediaQuery.of(context).size.width / 390,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ])),
    );
  }
}
