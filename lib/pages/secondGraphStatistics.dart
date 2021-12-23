import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class secondGraphStatistics extends StatefulWidget {
  // ignore: prefer_const_constructors_in_immutables
  secondGraphStatistics({Key key}) : super(key: key);

  @override
  _secondGraphStatisticsState createState() => _secondGraphStatisticsState();
}

class _secondGraphStatisticsState extends State<secondGraphStatistics> {
  List<_ChartData> data;
  TooltipBehavior _tooltip;

  @override
  void initState() {
    data = [
      _ChartData('Cases2020', 20164082, Colors.green),
      _ChartData('Death2020', 351754, Colors.red),
      _ChartData('Hospitalized 2020', 9388460, Colors.blue),
      _ChartData('Cases2021', 30542651, Colors.amber),
      _ChartData('Death2021', 454069, Colors.red),
      _ChartData('Hospitalized 2021', 28370567, Colors.blue),
    ];
    _tooltip = TooltipBehavior(enable: true);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff292929),
      body: Container(
        decoration: BoxDecoration(
          color: Color(0xff292929),
          borderRadius: BorderRadius.circular(10),
        ),
        height: MediaQuery.of(context).size.width / 2,
        width: MediaQuery.of(context).size.width,
        child: SfCartesianChart(
          palette: <Color>[Colors.red, Colors.green, Colors.blue],
          plotAreaBackgroundColor: Colors.black12,
          primaryXAxis: CategoryAxis(
            labelStyle: TextStyle(
                color: Colors.white,
                fontFamily: 'SF',
                fontSize: 20,
                fontWeight: FontWeight.w500),
            axisLine: AxisLine(color: Colors.white, width: 2),
          ),
          primaryYAxis: NumericAxis(
            minimum: 0,
            maximum: 50000000,
            interval: 10000000,
            labelStyle: TextStyle(
                color: Colors.white,
                fontFamily: 'SF',
                fontSize: 20,
                fontWeight: FontWeight.w500),
            axisLine: AxisLine(color: Colors.white, width: 2),
          ),
          tooltipBehavior: _tooltip,
          series: <ChartSeries<_ChartData, String>>[
            ColumnSeries<_ChartData, String>(
                dataSource: data,
                xValueMapper: (_ChartData data, _) => data.x,
                yValueMapper: (_ChartData data, _) => data.y,
                pointColorMapper: (_ChartData data, _) => data.color,
                name: 'Stats',
                color: Color.fromRGBO(8, 142, 255, 1))
          ],
        ),
      ),
    );
  }
}

class _ChartData {
  _ChartData(this.x, this.y, this.color);

  final String x;
  final double y;
  final Color color;
}
