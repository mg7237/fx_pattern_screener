import 'package:flutter/material.dart';
import 'package:fx_screener/screens/screener.dart';
import 'package:fx_screener/screens/add_favorite.dart';
import 'package:fx_screener/screens/pattern.dart';
import 'package:fx_screener/screens/chart.dart';
import 'package:fx_screener/custom_icons/bottom_icons.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;

  final pageController = PageController();
  List<Widget> _children = [];
  late Screener screener;
  late CandleChart chart;
  late Pattern pattern;
  late AddFavorite addFavorite;

  void _buildChildrenList() {
    screener = Screener();
    chart = CandleChart();
    pattern = Pattern();
    addFavorite = AddFavorite();

    _children = [
      screener,
      chart,
      pattern,
      addFavorite,
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
    });
  }

  _buildBottomBar() {
    return Stack(children: [
      Positioned(
        child: StyleProvider(
            style: Style(),
            child: ConvexAppBar(
                height: 60,
                style: TabStyle.reactCircle,
                backgroundColor: Colors.white,
                onTap: (int i) {
                  print("object $i");
                  onTabTapped(i);
                },
                items: [
                  TabItem(
                      title: 'Screener',
                      icon: Icon(BottomIcons.fi_rr_crown,
                          size: (_currentIndex == 0) ? 30 : 25,
                          color: (_currentIndex == 0)
                              ? Theme.of(context).primaryColor
                              : Color(0xff868A9A))),
                  TabItem(
                      title: 'Chart',
                      icon: Icon(BottomIcons.fi_rr_stats,
                          size: (_currentIndex == 1) ? 30 : 25,
                          color: (_currentIndex == 1)
                              ? Theme.of(context).primaryColor
                              : Color(0xff868A9A))),
                  TabItem(
                      title: 'Pattern',
                      icon: Icon(BottomIcons.fi_rr_pulse,
                          size: (_currentIndex == 2) ? 30 : 25,
                          color: (_currentIndex == 2)
                              ? Theme.of(context).primaryColor
                              : Color(0xff868A9A))),
                  TabItem(
                      title: 'Favorite',
                      icon: Icon(BottomIcons.fi_rr_star,
                          size: (_currentIndex == 3) ? 30 : 25,
                          color: (_currentIndex == 3)
                              ? Theme.of(context).primaryColor
                              : Color(0xff868A9A)))
                ])),
      ),
      Positioned(
          child: Container(
            height: 1,
            width: 200,
            color: Theme.of(context).primaryColor,
          ),
          bottom: 0,
          left: (MediaQuery.of(context).size.width / 2) - 100)
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

class Style extends StyleHook {
  @override
  double get activeIconSize => 40;

  @override
  double get activeIconMargin => 10;

  @override
  double get iconSize => 20;

  @override
  TextStyle textStyle(Color color) {
    return TextStyle(fontSize: 12, color: Colors.black);
  }
}
