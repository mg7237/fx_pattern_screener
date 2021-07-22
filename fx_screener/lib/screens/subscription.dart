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
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            elevation: 0,
            leading: IconButton(
                icon: Icon(Icons.arrow_back_ios),
                color: Colors.grey,
                onPressed: () => Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (_) => HomePage())))),
        body: Container(
            color: Color(0xffF7F8FB),
            padding: EdgeInsets.only(
                top: 15, left: ipad ? 25 : 15, right: ipad ? 25 : 15),
            child: Column(children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10)),
                child: Row(
                  children: [
                    Container(
                        height: 22,
                        width: 22,
                        child: Image(
                            image: AssetImage('assets/icons/blue_tick.png'))),
                    SizedBox(width: ipad ? 20 : 10),
                    Container(
                      margin: const EdgeInsets.symmetric(vertical: 1),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 3.0,
                      ),
                      child: Text("Remove all ads",
                          style: TextStyle(
                            fontSize: ipad ? 15 : 15,
                            fontFamily: "Poppins",
                          )),
                    )
                  ],
                ),
              ),
              SizedBox(height: 5),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10)),
                child: Row(
                  children: [
                    Container(
                        height: 22,
                        width: 22,
                        child: Image(
                            image: AssetImage('assets/icons/blue_tick.png'))),
                    SizedBox(width: ipad ? 20 : 10),
                    Container(
                      margin: const EdgeInsets.symmetric(vertical: 1),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 3.0,
                      ),
                      child: Text("Full access to all features",
                          style: TextStyle(
                            fontSize: ipad ? 15 : 15,
                            fontFamily: "Poppins",
                          )),
                    )
                  ],
                ),
              ),
              SizedBox(height: 5),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10)),
                child: Row(
                  children: [
                    Container(
                        height: 22,
                        width: 22,
                        child: Image(
                            image: AssetImage('assets/icons/blue_tick.png'))),
                    SizedBox(width: ipad ? 20 : 10),
                    Container(
                      margin: const EdgeInsets.symmetric(vertical: 1),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 3.0,
                      ),
                      child: Text("Unlocked all timeframes",
                          style: TextStyle(
                            fontSize: ipad ? 15 : 15,
                            fontFamily: "Poppins",
                          )),
                    )
                  ],
                ),
              ),
              SizedBox(height: 5),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10)),
                child: Row(
                  children: [
                    Container(
                        height: 22,
                        width: 22,
                        child: Image(
                            image: AssetImage('assets/icons/blue_tick.png'))),
                    SizedBox(width: ipad ? 20 : 10),
                    Container(
                      margin: const EdgeInsets.symmetric(vertical: 1),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 3.0,
                      ),
                      child: Text("Unlocked all chart patterns",
                          style: TextStyle(
                            fontSize: ipad ? 15 : 15,
                            fontFamily: "Poppins",
                          )),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 5),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10)),
                child: Row(
                  children: [
                    Container(
                        height: 22,
                        width: 22,
                        child: Image(
                            image: AssetImage('assets/icons/blue_tick.png'))),
                    SizedBox(width: ipad ? 20 : 10),
                    Container(
                      margin: const EdgeInsets.symmetric(vertical: 1),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 3.0,
                      ),
                      child: Text("Keeping up-to-date all patterns",
                          style: TextStyle(
                            fontSize: ipad ? 15 : 15,
                            fontFamily: "Poppins",
                          )),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: ipad ? 55 : 45,
              ),
              Text(
                'Get 3 Day Free Trial',
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
                          color: Colors.white, fontSize: 22, letterSpacing: 1),
                    ),
                    padding: EdgeInsets.only(
                        left: 70, right: 70, top: 10, bottom: 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: Theme.of(context).primaryColor,
                    )),
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
                    "After 3 days free trial, payment will be charged \$9.99 USD automatically each month to your Apple ID account unless it is cancelled no later than 24 hours prior to the renewal date. You can cancel automatic renewal or manage your subscription anytime by going to your Account Settings on the App Store.",
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                      fontFamily: "Poppins",
                      fontSize: ipad
                          ? 11 * MediaQuery.of(context).size.width / 390
                          : 12 * MediaQuery.of(context).size.width / 390,
                    ),
                  ),
                ),
              ),
            ])),
      ),
    );
  }
}
