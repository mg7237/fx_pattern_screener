import 'package:flutter/material.dart';
import 'package:fx_screener/models/currency_pair.dart';
import 'package:fx_screener/widgets/select_asset.dart';

class AddFavorite extends StatefulWidget {
  const AddFavorite({Key? key}) : super(key: key);

  @override
  _AddFavoriteState createState() => _AddFavoriteState();
}

class _AddFavoriteState extends State<AddFavorite> {
  TextEditingController _searchController = TextEditingController();
  late Map<String, Currency> _ccyData;
  late List<CurrencyPairData> _ccyPairData;

  void _selectAssetClass() {
    showDialog(
        context: context,
        builder: (_) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(20.0))),
            elevation: 10,
            content: SelectAsset(assetSelected: _assetClassSelected),
          );
        });
  }

  void _assetClassSelected(int index) {}

  @override
  void initState() {
    super.initState();
    _ccyData = getCurrencyData();
    _ccyPairData = getCurrencyPairData();
  }

  String _truncate(String input) {
    if (input.length > 25) {
      return input.substring(0, 25) + '...';
    }
    return input;
  }

  Widget _buildCurrencyList(BuildContext context, int listIndex) {
    return Container(
      child: Container(
        padding: const EdgeInsets.all(8.0),
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
                  onPressed: () => {},
                  icon: Icon(Icons.add),
                  iconSize: 30,
                )
              ],
            )
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
              centerTitle: true,
              backgroundColor: Theme.of(context).scaffoldBackgroundColor,
              elevation: 0,
              title: Container(
                height: 50,
                width: 300,
                child: Center(
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
                            borderRadius:
                                BorderRadius.all(Radius.circular(30))),
                        hintText: 'Search',
                        hintStyle: TextStyle(
                            color: Colors.grey,
                            fontFamily: 'Poppins',
                            fontSize: 12)),
                  ),
                ),
              ),
              actions: [
                IconButton(
                    onPressed: _selectAssetClass,
                    icon: Icon(
                      Icons.filter_alt_outlined,
                      color: Colors.black,
                    ))
              ],
            ),
            body: Container(
                padding: EdgeInsets.all(8),
                color: Theme.of(context).scaffoldBackgroundColor,
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
                      child: ListView.separated(
                          itemBuilder: _buildCurrencyList,
                          separatorBuilder: (BuildContext context, int index) {
                            return const Divider(
                              height: 20,
                              thickness: 1,
                              indent: 20,
                              endIndent: 20,
                            );
                          },
                          itemCount: _ccyPairData.length),
                    )
                  ],
                ))));
  }
}
