import 'package:flutter/material.dart';
import 'package:fx_screener/models/currency_pair.dart';
import 'package:fx_screener/custom_icons/bottom_icons.dart';

class SearchAsset extends StatefulWidget {
  const SearchAsset({Key? key}) : super(key: key);

  @override
  _SearchAssetState createState() => _SearchAssetState();
}

class _SearchAssetState extends State<SearchAsset> {
  TextEditingController _searchController = TextEditingController();
  late Map<String, Currency> _ccyData;
  late List<CurrencyPairData> _ccyPairData;
  late List<bool> favorites;
  late List<Color> _rowColor;
  late List<Color> _rowFont;

  String _truncate(String input) {
    if (input.length > 25) {
      return input.substring(0, 25) + '...';
    }
    return input;
  }

  Widget _buildCurrencyList(BuildContext context, int listIndex) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5),
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(15)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                _ccyPairData[listIndex].currencyOne +
                    _ccyPairData[listIndex].currencyTwo,
                style: TextStyle(
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.bold,
                    fontSize: 18),
              ),
              Text(
                  _truncate(_ccyData[_ccyPairData[listIndex].currencyOne]!
                          .currencyDescription +
                      ' / ' +
                      _ccyData[_ccyPairData[listIndex].currencyTwo]!
                          .currencyDescription),
                  style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 12,
                      color: Color(0xff868A9A)))
            ],
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 5.0),
                child: Container(
                    height: 26,
                    width: 26,
                    decoration: BoxDecoration(
                        border: Border.all(),
                        borderRadius: BorderRadius.circular(26)),
                    child: Center(
                      child: Text('Fx',
                          style:
                              TextStyle(fontSize: 10, fontFamily: 'Poppins')),
                    )),
              ),
              SizedBox(width: 10),
              Column(
                children: [
                  Text('FXCM',
                      style: TextStyle(fontSize: 18, fontFamily: 'Poppins')),
                  Text('forex',
                      style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 12,
                          color: Color(0xff868A9A)))
                ],
              ),
              IconButton(
                onPressed: () {
                  setState(() {
                    favorites[listIndex] = !favorites[listIndex];
                  });
                },
                icon: Icon(BottomIcons.fi_rr_star, color: Colors.grey[600]),
                iconSize: 30,
              )
            ],
          )
        ],
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _ccyData = getCurrencyData();
    _ccyPairData = getCurrencyPairData();
    favorites = List.filled(_ccyPairData.length, false);
    _rowColor = List.filled(_ccyPairData.length, Colors.white);
    _rowFont = List.filled(_ccyPairData.length, Colors.black);
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: SafeArea(
          child: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          elevation: 0,
          leading: IconButton(
              icon: Icon(
                Icons.arrow_back_ios,
                color: Colors.grey[600],
              ),
              onPressed: () => Navigator.of(context).maybePop()),
          //    MaterialPageRoute(builder: (_) => AddFavorite())),
        ),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        body: Padding(
          padding: const EdgeInsets.all(0.0),
          child: Column(
            children: [
              Container(
                height: 50,
                width: MediaQuery.of(context).size.width,
                child: TextField(
                  textCapitalization: TextCapitalization.characters,
                  controller: _searchController,
                  style: TextStyle(fontFamily: 'Poppins', fontSize: 14),
                  decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.search,
                        color: Colors.black,
                      ),
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 2.0, horizontal: 10),
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.all(Radius.circular(30))),
                      hintText: 'Search',
                      hintStyle: TextStyle(
                          color: Colors.black,
                          fontFamily: 'Poppins',
                          fontSize: 12)),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Expanded(
                child: ListView.builder(
                    itemBuilder: _buildCurrencyList,
                    itemCount: _ccyPairData.length),
              )
            ],
          ),
        ),
      )),
    );
  }
}
