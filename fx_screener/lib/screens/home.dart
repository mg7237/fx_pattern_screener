import 'package:flutter/material.dart';
import 'package:fx_screener/util/constants.dart';
import 'package:fx_screener/models/currency_pair.dart';
import 'package:fx_screener/widgets/my_drawer.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String _title = 'Screener';
  int _currentIndex = 0;
  late List<CurrencyPairData> _ccyPair;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _ccyPair = getCurrencyData();
  }

  void _selectDuration() {}

  void _selectSortBy() {}

  void _addFavorite() {}

  void _showScreener(int index) {
    _currentIndex = index;
    setState(() {});
  }

  Widget buildCurrencyPairList(BuildContext context, int listIndex) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 10),
      height: 80,
      width: double.infinity,
      child: Stack(
        children: [
          Positioned(
            left: 20,
            top: 20,
            child: Container(
              height: 50,
              width: 50,
              child: Image(
                  image: AssetImage('assets/flags/' +
                      _ccyPair[listIndex].currencyTwo +
                      '.png')),
            ),
          ),
          Positioned(
            child: Container(
              height: 50,
              width: 50,
              child: Image(
                  image: AssetImage('assets/flags/' +
                      _ccyPair[listIndex].currencyOne +
                      '.png')),
            ),
          ),
          Positioned(
            left: 100,
            top: 10,
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(
                _ccyPair[listIndex].currencyOne +
                    _ccyPair[listIndex].currencyTwo,
                style: TextStyle(
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              ),
              Text(
                'Updated 00.35 hours ago',
                style: TextStyle(fontFamily: 'Poppins', fontSize: 10),
              ),
            ]),
          ),
          Positioned(
            right: 20,
            top: 10,
            child: Column(
              children: [
                Container(
                    height: 35,
                    width: 35,
                    child: Image(
                        image: AssetImage('assets/icon/screener_icon.png'))),
                Text('Rectangle',
                    style: TextStyle(fontFamily: 'Poppins', fontSize: 12))
              ],
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
                foregroundColor: Colors.black,
                backgroundColor: Colors.white,
                elevation: 0,
                actions: [
                  Padding(
                    padding: const EdgeInsets.only(top: 5.0),
                    child: InkWell(
                        child: Container(
                          margin: EdgeInsets.all(14),
                          child: Text(
                            DURATION1D,
                            style: TextStyle(color: Colors.black, fontSize: 16),
                          ),
                        ),
                        onTap: () => _selectDuration()),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 5.0),
                    child: InkWell(
                        child: Container(
                            height: 30,
                            width: 30,
                            child: Image(
                                image: AssetImage('assets/icon/settings.png'))),
                        onTap: () => _selectSortBy()),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 5.0),
                    child: IconButton(
                      onPressed: _addFavorite,
                      icon: Icon(Icons.add),
                      color: Colors.black,
                      iconSize: 30,
                    ),
                  )
                ],
                leading: Builder(
                    builder: (context) => // Ensure Scaffold is in context
                        IconButton(
                            icon: Icon(Icons.menu),
                            color: Colors.black,
                            onPressed: () =>
                                Scaffold.of(context).openDrawer()))),
            drawer: MyDrawer(),
            bottomNavigationBar: BottomNavigationBar(
              backgroundColor: Colors.white,
              elevation: 0,
              selectedFontSize: 18,
              unselectedFontSize: 16,
              selectedItemColor: Colors.black,
              unselectedItemColor: Colors.grey[400],
              selectedLabelStyle:
                  TextStyle(fontFamily: 'Poppins', fontWeight: FontWeight.bold),
              unselectedLabelStyle: TextStyle(fontFamily: 'Poppins'),
              onTap: (index) => _showScreener(index),
              currentIndex: _currentIndex,
              type: BottomNavigationBarType.fixed,
              iconSize: 30,
              items: <BottomNavigationBarItem>[
                BottomNavigationBarItem(label: 'Screener', icon: Text('')),
                BottomNavigationBarItem(label: 'Chart', icon: Text('')),
                BottomNavigationBarItem(label: 'Pattern', icon: Text('')),
                BottomNavigationBarItem(label: 'Favorite', icon: Text('')),
              ],
            ),
            body: Container(
                child: ListView.builder(
                    itemCount: _ccyPair.length,
                    itemBuilder: buildCurrencyPairList))));
  }
}
