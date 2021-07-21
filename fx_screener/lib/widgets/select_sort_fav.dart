import 'package:flutter/material.dart';

class SelectSort extends StatelessWidget {
  const SelectSort({Key? key, required this.sortSelected}) : super(key: key);
  final Function sortSelected;

  @override
  Widget build(BuildContext context) {
    const List<String> SORT_LIST = ['Alphabet', 'Type'];
    return Container(
      padding: const EdgeInsets.all(12.0),
      color: Theme.of(context).scaffoldBackgroundColor,
      height: 220,
      width: 150,
      child: Column(
        children: [
          Container(
            height: 40,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Theme.of(context).scaffoldBackgroundColor,
            ),
            child: Center(
              child: Text('Sort By',
                  style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontSize: 18,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.bold)),
            ),
          ),
          SizedBox(height: 20),
          Expanded(
            child: ListView.separated(
                shrinkWrap: true,
                itemBuilder: (_, int index) {
                  return Container(
                      child: Center(
                    child: InkWell(
                      onTap: () {
                        sortSelected(index);
                        Navigator.pop(context);
                      },
                      child: Text(SORT_LIST[index],
                          style:
                              TextStyle(fontSize: 16, fontFamily: 'Poppins')),
                    ),
                  ));
                },
                separatorBuilder: (BuildContext context, int index) {
                  return const Divider(
                    height: 20,
                    thickness: 1,
                    indent: 20,
                    endIndent: 20,
                  );
                },
                itemCount: SORT_LIST.length),
          )
        ],
      ),
    );
  }
}
