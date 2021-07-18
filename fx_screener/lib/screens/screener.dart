import 'package:flutter/material.dart';
import 'package:fx_screener/util/constants.dart';
import 'package:fx_screener/models/currency_pair.dart';
import 'package:fx_screener/widgets/select_duration.dart';
import 'package:fx_screener/widgets/select_sort.dart';
import 'package:fx_screener/widgets/select_asset.dart';
import 'package:fx_screener/widgets/drawer.dart';

class Screener extends StatefulWidget {
  @override
  _ScreenerState createState() => _ScreenerState();
}

class _ScreenerState extends State<Screener> {
  late List<CurrencyPairData> _ccyPair;

  @override
  void initState() {
    super.initState();
    _ccyPair = getCurrencyPairData();
  }

  void _selectAssetClass() {
    showDialog(
        context: context,
        builder: (_) {
          return AlertDialog(
            elevation: 10,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(20.0))),
            content: SelectAsset(assetSelected: _assetClassSelected),
          );
        });
  }

  void _assetClassSelected(int index) {}

  void _selectDuration() {
    showDialog(
        context: context,
        builder: (_) {
          return AlertDialog(
            elevation: 10,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(20.0))),
            content: SelectDuration(durationSelected: _durationSelected),
          );
        });
  }

  void _selectSortBy() {
    showDialog(
        context: context,
        builder: (_) {
          return AlertDialog(
            elevation: 10,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(20.0))),
            content: SelectSort(sortSelected: _sortSelected),
          );
        });
    //SelectSort
  }

  void _durationSelected(int index) {}

  void _sortSelected(int index) {}

  Widget buildCurrencyPairList(BuildContext context, int listIndex) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 5),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(15)),
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
              left: 90,
              top: 10,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
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
                      style: TextStyle(fontFamily: 'Poppins', fontSize: 12),
                    ),
                  ]),
            ),
            Positioned(
                right: 1,
                child: Column(
                  children: [
                    Container(
                        height: 45,
                        width: 45,
                        child:
                            Image(image: AssetImage('assets/patterns/RE.png'))),
                    Text(
                      'Rectangle',
                      style: TextStyle(fontFamily: 'Poppins', fontSize: 12),
                    )
                  ],
                ))
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
                elevation: 0,
                backgroundColor: Colors.white,
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
                      padding: const EdgeInsets.only(top: 5.0, right: 10),
                      child: IconButton(
                          onPressed: _selectAssetClass,
                          icon: Icon(
                            Icons.filter_alt_outlined,
                            color: Colors.black,
                          ))),
                  Padding(
                    padding: const EdgeInsets.only(top: 5.0, right: 10),
                    child: InkWell(
                        child: Container(
                            height: 30,
                            width: 30,
                            child: Image(
                                image:
                                    AssetImage('assets/icons/settings.png'))),
                        onTap: () => _selectSortBy()),
                  ),
                ],
                leading: Container(
                  height: 10,
                  width: 30,
                  child: Builder(
                      builder: (context) => // Ensure Scaffold is in context
                          InkWell(
                              child: Image(
                                  image: AssetImage('assets/icons/menu.png')),
                              onTap: () => Scaffold.of(context).openDrawer())),
                )),
            drawer: AppDrawer(),
            body: Container(
                // color: backGroundColor,
                color: Color(0xffF7F8FB),
                child: ListView.builder(
                    itemCount: _ccyPair.length,
                    itemBuilder: buildCurrencyPairList))));
  }
}
