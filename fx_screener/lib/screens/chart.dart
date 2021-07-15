import 'package:flutter/material.dart';
import 'package:candlesticks/candlesticks.dart';

class CandleChart extends StatefulWidget {
  const CandleChart({Key? key}) : super(key: key);

  @override
  _CandleChartState createState() => _CandleChartState();
}

class _CandleChartState extends State<CandleChart> {
  List<Candle> candles = [];
  // [
  //   Candle(
  //       date: DateTime.parse("2021-05-16T11:00:00.000Z"),
  //       open: 50.0,
  //       high: 100.0,
  //       low: 40.0,
  //       close: 80,
  //       volume: 5000.0),
  //   Candle(
  //       date: DateTime.parse("2021-05-17T11:00:00.000Z"),
  //       open: 80.0,
  //       high: 90.0,
  //       low: 55.0,
  //       close: 65,
  //       volume: 4000.0),
  //   Candle(
  //       date: DateTime.parse("2021-05-18T11:00:00.000Z"),
  //       open: 65.0,
  //       high: 120.0,
  //       low: 60.0,
  //       close: 90,
  //       volume: 7000.0),
  //   Candle(
  //       date: DateTime.parse("2021-05-19T11:00:00.000Z"),
  //       open: 90.0,
  //       high: 95.0,
  //       low: 85.0,
  //       close: 80,
  //       volume: 2000.0),
  //   Candle(
  //       date: DateTime.parse("2021-05-20T11:00:00.000Z"),
  //       open: 80.0,
  //       high: 85.0,
  //       low: 40.0,
  //       close: 50,
  //       volume: 3000.0),
  //   Candle(
  //       date: DateTime.parse("2021-05-21T11:00:00.000Z"),
  //       open: 50.0,
  //       high: 100.0,
  //       low: 40.0,
  //       close: 80,
  //       volume: 5000.0),
  //   Candle(
  //       date: DateTime.parse("2021-05-22T11:00:00.000Z"),
  //       open: 80.0,
  //       high: 90.0,
  //       low: 55.0,
  //       close: 65,
  //       volume: 4000.0),
  //   Candle(
  //       date: DateTime.parse("2021-05-23T11:00:00.000Z"),
  //       open: 65.0,
  //       high: 120.0,
  //       low: 60.0,
  //       close: 90,
  //       volume: 7000.0),
  //   Candle(
  //       date: DateTime.parse("2021-05-24T11:00:00.000Z"),
  //       open: 90.0,
  //       high: 95.0,
  //       low: 85.0,
  //       close: 80,
  //       volume: 2000.0),
  //   Candle(
  //       date: DateTime.parse("2021-05-25T11:00:00.000Z"),
  //       open: 80.0,
  //       high: 85.0,
  //       low: 40.0,
  //       close: 50,
  //       volume: 3000.0),
  //   Candle(
  //       date: DateTime.parse("2021-05-26T11:00:00.000Z"),
  //       open: 50.0,
  //       high: 100.0,
  //       low: 40.0,
  //       close: 80,
  //       volume: 5000.0),
  //   Candle(
  //       date: DateTime.parse("2021-05-27T11:00:00.000Z"),
  //       open: 80.0,
  //       high: 90.0,
  //       low: 55.0,
  //       close: 65,
  //       volume: 4000.0),
  //   Candle(
  //       date: DateTime.parse("2021-05-28T11:00:00.000Z"),
  //       open: 65.0,
  //       high: 120.0,
  //       low: 60.0,
  //       close: 90,
  //       volume: 7000.0),
  //   Candle(
  //       date: DateTime.parse("2021-05-29T11:00:00.000Z"),
  //       open: 90.0,
  //       high: 95.0,
  //       low: 85.0,
  //       close: 80,
  //       volume: 2000.0),
  //   Candle(
  //       date: DateTime.parse("2021-05-30T11:00:00.000Z"),
  //       open: 80.0,
  //       high: 85.0,
  //       low: 40.0,
  //       close: 50,
  //       volume: 3000.0),
  // ];

  List<Candle> getCandles() {
    final List<Candle> output = [];
    final time = DateTime.now();
    for (int i = 0; i < 50; i++) {
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
    return new Scaffold(
        body: new Center(
            child: new Center(
      child: AspectRatio(
        aspectRatio: 1.2,
        child: Candlesticks(
          candles: candles,
        ),
      ),
    )));
  }
}
