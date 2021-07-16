import 'package:flutter/material.dart';
import 'dart:io';
import 'package:fx_screener/screens/home.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebviewPage extends StatefulWidget {
  const WebviewPage({Key? key, required this.url, required this.title})
      : super(key: key);
  final String url;
  final String title;
  @override
  _WebviewPageState createState() => _WebviewPageState();
}

class _WebviewPageState extends State<WebviewPage> {
  @override
  void initState() {
    super.initState();
    if (Platform.isAndroid) WebView.platform = SurfaceAndroidWebView();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                print('pop');
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (_) => HomePage()));
              },
              icon: Icon(
                Icons.arrow_back_ios,
                color: Colors.white,
              )),
          title: Text(widget.title,
              style: TextStyle(color: Colors.white, fontFamily: 'Poppins')),
          backgroundColor: Theme.of(context).primaryColor,
        ),
        body: WebView(
          initialUrl: widget.url,
        ),
      ),
    );
  }
}
