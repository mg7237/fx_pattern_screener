import 'package:flutter/material.dart';
import 'package:fx_screener/models/currency_pair.dart';
import 'package:fx_screener/custom_icons/bottom_icons.dart';
import 'package:fx_screener/widgets/select_sort_fav.dart';
import 'package:fx_screener/screens/search_asset.dart';

class AddFavorite extends StatefulWidget {
  const AddFavorite({Key? key}) : super(key: key);

  @override
  _AddFavoriteState createState() => _AddFavoriteState();
}

class _AddFavoriteState extends State<AddFavorite> {
  late Map<String, Currency> _ccyData;
  late List<CurrencyPairData> _ccyPairData;
  late List<bool> favorites;
  Color? grey = Colors.grey[600]; // Color(0xFF868A9A);

  void _sortSelected(int index) {}

  void _searchAsset() {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (_) => SearchAsset()));
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

  // void _selectAssetClass() {
  //   showDialog(
  //       context: context,
  //       builder: (_) {
  //         return AlertDialog(
  //           shape: RoundedRectangleBorder(
  //               borderRadius: BorderRadius.all(Radius.circular(20.0))),
  //           elevation: 10,
  //           content: SelectAsset(assetSelected: _assetClassSelected),
  //         );
  //       });
  // }

  void _assetClassSelected(int index) {}

  @override
  void initState() {
    super.initState();
    _ccyData = getCurrencyData();
    _ccyPairData = getCurrencyPairData();
    favorites = List.filled(_ccyPairData.length, true);
  }

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
                icon: Icon(
                    favorites[listIndex]
                        ? BottomIcons.fi_sr_star
                        : BottomIcons.fi_rr_star,
                    color:
                        favorites[listIndex] ? Colors.green : Colors.grey[600]),
                iconSize: 30,
              )
            ],
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
              leading: IconButton(
                  icon: Icon(Icons.arrow_back_ios),
                  color: Colors.grey[600],
                  onPressed: () => Navigator.of(context).pop()),
              backgroundColor: Theme.of(context).scaffoldBackgroundColor,
              elevation: 0,
              actions: [
                Padding(
                    padding: const EdgeInsets.only(top: 4.0, right: 15),
                    child: IconButton(
                      color: Colors.grey[600],
                      icon: Icon(BottomIcons.fi_rr_interlining),
                      onPressed: () => _selectSortBy(),
                    )),
                Padding(
                  padding: const EdgeInsets.only(top: 4.0, right: 15),
                  child: IconButton(
                      iconSize: 30,
                      onPressed: _searchAsset,
                      icon: Icon(
                        Icons.add,
                        color: Colors.grey[600],
                      )),
                )
              ],
            ),
            body: Container(
                padding: EdgeInsets.all(8),
                color: Color(0xffF7F8FB),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 10),
                      child: Text(
                        '${_ccyPairData.length.toString()} Symbols',
                        style: TextStyle(
                            fontSize: 14,
                            fontFamily: 'Poppins',
                            color: Color(0xff868A9A)),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Expanded(
                      child: ListView.builder(
                          itemBuilder: _buildCurrencyList,
                          itemCount: _ccyPairData.length),
                    )
                  ],
                ))));
  }
}
