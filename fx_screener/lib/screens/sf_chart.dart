import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:intl/intl.dart';

class SfChart extends StatefulWidget {
  const SfChart({Key? key}) : super(key: key);

  @override
  _SfChartState createState() => _SfChartState();
}

class _SfChartState extends State<SfChart> {
  late List<ChartData> _chartDataList;
  late TrackballBehavior _trackBallBehavior;

  @override
  void initState() {
    super.initState();
    _chartDataList = getChartData();
    _trackBallBehavior = TrackballBehavior(
        enable: true, activationMode: ActivationMode.singleTap);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: SfCartesianChart(
                title: ChartTitle(text: 'Candle Chart'),
                trackballBehavior: _trackBallBehavior,
                series: <CandleSeries>[
                  CandleSeries<ChartData, DateTime>(
                    dataSource: _chartDataList,
                    xValueMapper: (ChartData sales, _) => sales.x,
                    lowValueMapper: (ChartData sales, _) => sales.low,
                    highValueMapper: (ChartData sales, _) => sales.high,
                    openValueMapper: (ChartData sales, _) => sales.open,
                    closeValueMapper: (ChartData sales, _) => sales.close,
                  )
                ],
                primaryXAxis: DateTimeAxis(dateFormat: DateFormat.Md()),
                primaryYAxis: NumericAxis(
                    minimum: 1500,
                    maximum: 3000,
                    interval: 100,
                    numberFormat:
                        NumberFormat.simpleCurrency(decimalDigits: 0)))));
  }

  List<ChartData> getChartData_10() {
    return [
      ChartData(
          x: DateTime(2021, 6, 1),
          open: 110.8,
          high: 116.8,
          low: 110.8,
          close: 113.5),
      ChartData(
          x: DateTime(2021, 6, 2),
          open: 113.8,
          high: 119.8,
          low: 109.8,
          close: 101.5),
      ChartData(
          x: DateTime(2021, 6, 3),
          open: 105.5,
          high: 120.8,
          low: 106.8,
          close: 118.5),
      ChartData(
          x: DateTime(2021, 6, 4),
          open: 106.5,
          high: 126.8,
          low: 107.8,
          close: 119.5),
      ChartData(
          x: DateTime(2021, 6, 5),
          open: 107.5,
          high: 127.8,
          low: 107.8,
          close: 117.5),
      ChartData(
          x: DateTime(2021, 6, 6),
          open: 108.5,
          high: 128.8,
          low: 108.8,
          close: 118.5),
      ChartData(
          x: DateTime(2021, 6, 7),
          open: 109.5,
          high: 129.8,
          low: 109.8,
          close: 119.5),
      ChartData(
          x: DateTime(2021, 6, 8),
          open: 110.5,
          high: 131.8,
          low: 111.8,
          close: 121.5),
      ChartData(
          x: DateTime(2021, 6, 9),
          open: 123.5,
          high: 126.8,
          low: 112.8,
          close: 118.5),
      ChartData(
          x: DateTime(2021, 6, 10),
          open: 126.5,
          high: 129.8,
          low: 113.8,
          close: 118.5),
      ChartData(
          x: DateTime(2021, 6, 11),
          open: 121.5,
          high: 123.8,
          low: 111.8,
          close: 122.5)
    ];
  }
}

List<ChartData> getChartData() {
  final List<ChartData> output = [];
  final time = DateTime.now();
  for (int i = 0; i < 50; i++) {
    output.add(ChartData(
        open: 1700 + i * 20,
        high: 1800 + i * 20 + 0.0000001,
        low: 1700 + i * 10 - 0.00011,
        close: 1800 + i * 10,
        x: time.subtract(Duration(days: 1 * i))));
  }
  return output;
}

class ChartData {
  final DateTime? x;
  final num? open;
  final num? close;
  final num? high;
  final num? low;

  ChartData({this.x, this.open, this.close, this.high, this.low});
}
