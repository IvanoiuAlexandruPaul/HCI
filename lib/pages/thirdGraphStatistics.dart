import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

void main() {
  return runApp(thirdGraphStatistics());
}

class thirdGraphStatistics extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.blue),
      home: _MyHomePage(),
    );
  }
}

class _MyHomePage extends StatefulWidget {
  // ignore: prefer_const_constructors_in_immutables
  _MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<_MyHomePage> {
  List<_ChartData> data;
  TooltipBehavior _tooltip;

  @override
  void initState() {
    data = [
      _ChartData('Fully Vaccinated', 202358902),
      _ChartData('At least one dose', 241571082),
      _ChartData('Death', 804266),
    ];
    _tooltip = TooltipBehavior(enable: true);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SfCartesianChart(
        legend: Legend(
          position: LegendPosition.bottom,
          isVisible: true,
        ),
        backgroundColor: CupertinoColors.darkBackgroundGray,
        primaryXAxis: CategoryAxis(),
        primaryYAxis:
            NumericAxis(minimum: 0, maximum: 300000000, interval: 100000000),
        tooltipBehavior: _tooltip,
        series: <ChartSeries<_ChartData, String>>[
          BubbleSeries<_ChartData, String>(
              minimumRadius: 25,
              maximumRadius: 100,
              dataSource: data,
              xValueMapper: (_ChartData data, _) => data.x,
              yValueMapper: (_ChartData data, _) => data.y,
              name: 'VaccinatedPeople / Death Situation',
              color: Colors.amber)
        ],
      ),
    );
  }
}

class _ChartData {
  _ChartData(this.x, this.y);

  final String x;
  final double y;
}
