import 'package:flutter/material.dart';
import 'package:fx_screener/screens/screener.dart';
import 'package:fx_screener/util/constants.dart';
import 'package:fx_screener/models/currency_pair.dart';
import 'package:fx_screener/widgets/my_drawer.dart';
import 'package:fx_screener/widgets/select_duration.dart';
import 'package:fx_screener/widgets/select_sort.dart';
import 'package:fx_screener/screens/add_favorite.dart';
import 'package:fx_screener/screens/screener.dart';
import 'package:fx_screener/screens/pattern.dart';
import 'package:fx_screener/screens/add_favorite.dart';
import 'package:fx_screener/screens/chart.dart';
import 'package:fx_screener/widgets/select_asset.dart';

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
    });
  }

  _buildBottomBar() {
    return BottomNavigationBar(
      backgroundColor: Theme.of(context).primaryColor,
      selectedFontSize: 12,
      unselectedFontSize: 10,
      selectedItemColor: Colors.white,
      unselectedItemColor: Colors.grey[400],
      onTap: onTabTapped,
      currentIndex: _currentIndex,
      type: BottomNavigationBarType.fixed,
      iconSize: 30,
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
            icon: Icon(Icons.circle_outlined), label: 'Screener'),
        BottomNavigationBarItem(
          icon: Icon(Icons.bar_chart_outlined),
          label: 'Chart',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.insights),
          label: 'Pattern',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.favorite_outline),
          label: 'Favorite',
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: PageView(
        children: _children,
        controller: pageController,
        physics: NeverScrollableScrollPhysics(),
      ),
      bottomNavigationBar: _buildBottomBar(),
    ));
  }
}
