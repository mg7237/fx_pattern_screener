import 'package:flutter/material.dart';
import 'package:fx_screener/util/constants.dart';

class SelectDuration extends StatelessWidget {
  const SelectDuration({Key? key, required this.durationSelected})
      : super(key: key);
  final Function durationSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12.0),
      color: Theme.of(context).scaffoldBackgroundColor,
      height: 300,
      width: 200,
      child: Column(
        children: [
          Container(
            height: 40,
            color: Theme.of(context).primaryColor,
            child: Center(
              child: Text('Timeframe',
                  style: TextStyle(
                      color: Colors.white,
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
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10)),
                      child: InkWell(
                          onTap: () {
                            durationSelected(index);
                            Navigator.pop(context);
                          },
                          child: Text(DURATION_LIST[index],
                              style: TextStyle(
                                  fontSize: 16, fontFamily: 'Poppins'))));
                },
                separatorBuilder: (BuildContext context, int index) {
                  return SizedBox(
                    height: 15,
                  );
                },
                itemCount: DURATION_LIST.length),
          )
        ],
      ),
    );
  }
}
