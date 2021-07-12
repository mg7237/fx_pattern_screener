import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
//import 'package:url_launcher/url_launcher.dart';

fieldFocusChange(
    BuildContext context, FocusNode currentFocus, FocusNode nextFocus) {
  currentFocus.unfocus();
  FocusScope.of(context).requestFocus(nextFocus);
}

class Utility {
  static void showInfoDialog(BuildContext context, String title, String msg) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text(title),
            content: Text(msg),
            actions: <Widget>[
              FlatButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text("Ok"))
            ],
          );
        });
  }

  static void showSuccessSnackBar(BuildContext? context, String message,
      {Color? color}) {
    if (color == null) {
      color = Colors.green[900];
    }
    final snackBar = SnackBar(
      content: Text(message),
      backgroundColor: color,
    );
    // Find the Scaffold in the Widget tree and use it to show a SnackBar!
    if (context != null) {
      ScaffoldMessenger.of(context).removeCurrentSnackBar();
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }

  static void showErrorSnackBar(BuildContext? context, String message,
      {Color? color}) {
    if (color == null) {
      color = Colors.red[900];
    }
    final snackBar = SnackBar(
      content: Text(message),
      backgroundColor: color,
    );
    // Find the Scaffold in the Widget tree and use it to show a SnackBar!
    if (context != null) {
      ScaffoldMessenger.of(context).removeCurrentSnackBar();
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }

  static String getFilterNumber(String x) {
    var lastThree = x.substring(x.length - 3);
    var otherNumbers = x.substring(0, x.length - 3);
    if (otherNumbers != '') lastThree = ',' + lastThree;
    var res = otherNumbers.replaceAll(RegExp("\\B(?=(\\d{2})+(?!\\d))"), ",") +
        lastThree;
    return res;
  }

  static String getFilerExtension(String x) {
    var lastThree = x.substring(x.length - 3);
    var otherNumbers = x.substring(0, x.length - 3);
    if (otherNumbers != '') lastThree = lastThree;
    var res = lastThree;
    return res;
  }

//  static launchURL(String url) async {
//    if (await canLaunch(url)) {
//      await launch(url);
//    } else {
//      throw 'Could not launch $url';
//    }
//  }
}
