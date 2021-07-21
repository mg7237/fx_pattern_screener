import 'package:flutter/material.dart';
import 'package:candlesticks/candlesticks.dart';

class CandleChart extends StatefulWidget {
  const CandleChart({Key? key}) : super(key: key);

  @override
  _CandleChartState createState() => _CandleChartState();
}

class _CandleChartState extends State<CandleChart> {
  List<Candle> candles = [];

  List<Candle> getCandles() {
    final List<Candle> output = [];
    final time = DateTime.now();
    for (int i = 0; i < 500; i++) {
      output.add(Candle(
          open: 1700 + i * 20,
          high: 1800 + i * 20 + 0.0000001,
          low: 1700 + i * 10 - 0.00011,
          close: 1800 + i * 10,
          volume: 1.0 * i,
          date: time.subtract(Duration(days: 1 * i))));
    }
    return output;
  }

  @override
  void initState() {
    super.initState();
    candles = getCandles();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: RotationTransition(
      turns: AlwaysStoppedAnimation(270 / 360),
      child: Container(
          alignment: Alignment.topCenter,
          color: Color(0xffF7F8FB),
          child: new Center(
            child: AspectRatio(
              aspectRatio: 1.2,
              child: Candlesticks(
                candles: candles,
              ),
            ),
          )),
    ));
  }
}
