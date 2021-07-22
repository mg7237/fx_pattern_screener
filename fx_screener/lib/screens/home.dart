import 'package:flutter/material.dart';
import 'package:fx_screener/screens/screener.dart';
import 'package:fx_screener/screens/pattern.dart';
import 'package:fx_screener/screens/sf_chart.dart';
import 'package:fx_screener/custom_icons/bottom_icons.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;

  final pageController = PageController();
  List<Widget> _children = [];
  late Screener screener;
  late SfChart chart;
  late Pattern pattern;

  void _buildChildrenList() {
    screener = Screener();
    chart = SfChart();
    pattern = Pattern();

    _children = [
      screener,
      chart,
      pattern,
    ];
  }

  @override
  void initState() {
    super.initState();
    _buildChildrenList();
  }

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
      pageController.jumpToPage(index);
      // if (index == 1) {
      //   // Navigator.of(context)
      //   //     .push(MaterialPageRoute(builder: (context) => VideoApp()));
      //   // Timer(Duration(seconds: 1), () => pageController.jumpToPage(index));
      // } else {

      // }
    });
  }

  _buildBottomBar() {
    return BottomNavigationBar(
        elevation: 15,
        backgroundColor: Colors.white,
        selectedFontSize: 14,
        unselectedFontSize: 12,
        selectedItemColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.grey[400],
        onTap: onTabTapped,
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.fixed,
        selectedIconTheme:
            IconThemeData(color: Theme.of(context).primaryColor, size: 30),
        unselectedIconTheme: IconThemeData(color: Colors.grey[400], size: 25),
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              label: 'Screener', icon: Icon(BottomIcons.fi_rr_crown)),
          BottomNavigationBarItem(
              label: 'Chart', icon: Icon(BottomIcons.fi_rr_stats)),
          BottomNavigationBarItem(
              label: 'Pattern',
              icon: Icon(
                BottomIcons.fi_rr_pulse,
              )),
        ]);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: PageView(
          children: _children,
          controller: pageController,
          physics: NeverScrollableScrollPhysics()),
      bottomNavigationBar: _buildBottomBar(),
    ));
  }
}
