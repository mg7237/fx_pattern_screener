import 'package:flutter/material.dart';
import 'package:fx_screener/screens/screener.dart';
import 'package:fx_screener/models/currency_pair.dart';
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
  String _title = 'Screener';
  int _currentIndex = 0;
  late List<CurrencyPairData> _ccyPair;

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
      setState(() {});
    });
  }

  _buildBottomBar() {
    return Stack(children: [
      ConvexAppBar(
          style: TabStyle.react,
          backgroundColor: Colors.white,
          onTap: (int i) {
            print("object $i");
            onTabTapped(i);
          },
          items: [
            TabItem(
                title: 'Screener',
                icon: Icon(BottomIcons.fi_rr_crown,
                    color: (_currentIndex == 0)
                        ? Theme.of(context).primaryColor
                        : Color(0xff868A9A))),
            TabItem(
                title: 'Chart',
                icon: Icon(BottomIcons.fi_rr_stats,
                    color: (_currentIndex == 1)
                        ? Theme.of(context).primaryColor
                        : Color(0xff868A9A))),
            TabItem(
                title: 'Pattern',
                icon: Icon(BottomIcons.fi_rr_pulse,
                    color: (_currentIndex == 2)
                        ? Theme.of(context).primaryColor
                        : Color(0xff868A9A))),
            TabItem(
                title: 'Favorite',
                icon: Icon(BottomIcons.fi_rr_star,
                    color: (_currentIndex == 3)
                        ? Theme.of(context).primaryColor
                        : Color(0xff868A9A)))
          ]),
      Positioned(
          child: Container(
            height: 3,
            width: 160,
            color: Theme.of(context).primaryColor,
          ),
          bottom: 1,
          left: (MediaQuery.of(context).size.width / 2) - 80)
    ]);

    // BottomNavigationBar(
    //   backgroundColor: Theme.of(context).primaryColor,
    //   selectedFontSize: 12,
    //   unselectedFontSize: 10,
    //   selectedItemColor: Colors.white,
    //   unselectedItemColor: Colors.grey[400],
    //   onTap: onTabTapped,
    //   currentIndex: _currentIndex,
    //   type: BottomNavigationBarType.fixed,
    //   iconSize: 30,
    //   items: <BottomNavigationBarItem>[
    //     BottomNavigationBarItem(
    //         icon: Icon(Icons.circle_outlined), label: 'Screener'),
    //     BottomNavigationBarItem(
    //       icon: Icon(Icons.bar_chart_outlined),
    //       label: 'Chart',
    //     ),
    //     BottomNavigationBarItem(
    //       icon: Icon(Icons.insights),
    //       label: 'Pattern',
    //     ),
    //     BottomNavigationBarItem(
    //       icon: Icon(Icons.favorite_outline),
    //       label: 'Favorite',
    //     ),
    //   ],
    // );
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
