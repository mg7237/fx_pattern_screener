import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:fx_screener/screens/splash_screen.dart';
import 'package:fx_screener/screens/home.dart';
import 'package:fx_screener/util/constants.dart';
import 'package:fx_screener/providers/theme_manager.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (context) => ThemeNotifier()),
  ], child: MyApp()));
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with WidgetsBindingObserver {
  late StreamSubscription subscription;
  bool showNoInternet = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance?.addObserver(this);
    subscription = Connectivity()
        .onConnectivityChanged
        .listen((ConnectivityResult result) {
      if (result == ConnectivityResult.none) {
        showNoInternet = true;
      } else {
        showNoInternet = false;
      }
      setState(() {});
    });
  }

  @override
  void dispose() {
    WidgetsBinding.instance?.removeObserver(this);
    subscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    return OverlaySupport(
      child: MaterialApp(
          title: 'fx_screener',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            brightness: Brightness.light,
            primarySwatch: Colors.blue,
          ),
          darkTheme: ThemeData(
            brightness: Brightness.dark,
            primarySwatch: Colors.blue,
          ),
          builder: (context, child) {
            return showNoInternet ? NoInternet() : child ?? Container();
          },
          home: SplashScreen(),
          routes: <String, WidgetBuilder>{
            HOME_PAGE: (BuildContext context) => HomePage(),
          }),
    );
  }
}

class NoInternet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F7F7),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Image.asset("assets/icons/app_logo.png"),
            Image.asset("assets/icons/no_internet.png"),
          ],
        ),
      ),
    );
  }
}
