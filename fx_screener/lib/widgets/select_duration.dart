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
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Theme.of(context).scaffoldBackgroundColor,
      ),
      height: 330,
      width: 200,
      child: Column(
        children: [
          Container(
            height: 40,
            child: Center(
              child: Text('Timeframe',
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
                          durationSelected(index);
                          Navigator.pop(context);
                        },
                        child: Container(
                          width: MediaQuery.of(context).size.width - 30,
                          height: 30,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10)),
                          child: Row(
                            children: [
                              Container(
                                margin: EdgeInsets.only(left: 5),
                                child: Image(
                                    image: (DURATION_LIST[index] != '1 day')
                                        ? AssetImage('assets/icons/locked.png')
                                        : AssetImage(
                                            'assets/icons/unlocked.png')),
                                height: 30,
                                width: 30,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(DURATION_LIST[index],
                                  style: TextStyle(
                                      fontSize: 16, fontFamily: 'Poppins')),
                            ],
                          ),
                        )),
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
                itemCount: DURATION_LIST.length),
          )
        ],
      ),
    );
  }
}
