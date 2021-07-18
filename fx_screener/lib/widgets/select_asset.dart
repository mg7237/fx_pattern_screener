import 'package:flutter/material.dart';

class SelectAsset extends StatelessWidget {
  const SelectAsset({Key? key, required this.assetSelected}) : super(key: key);
  final Function assetSelected;

  @override
  Widget build(BuildContext context) {
    const List<String> ASSET_LIST = ['Forex', 'Crypto'];

    return Container(
      padding: const EdgeInsets.all(12.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Theme.of(context).scaffoldBackgroundColor,
      ),
      height: 200,
      width: 150,
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(40)),
            height: 40,
            child: Center(
              child: Text('Filter',
                  style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontSize: 18,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.bold)),
            ),
          ),
          const Divider(
            height: 20,
            thickness: 1,
            indent: 20,
            endIndent: 20,
          ),
          Expanded(
            child: ListView.separated(
                shrinkWrap: true,
                itemBuilder: (_, int index) {
                  return Center(
                    child: Container(
                        child: InkWell(
                      onTap: () {
                        assetSelected(index);
                        Navigator.pop(context);
                      },
                      child: Text(ASSET_LIST[index],
                          style:
                              TextStyle(fontSize: 16, fontFamily: 'Poppins')),
                    )),
                  );
                },
                separatorBuilder: (BuildContext context, int index) {
                  return const Divider(
                    height: 20,
                    thickness: 1,
                    indent: 20,
                    endIndent: 20,
                  );
                },
                itemCount: ASSET_LIST.length),
          )
        ],
      ),
    );
  }
}
