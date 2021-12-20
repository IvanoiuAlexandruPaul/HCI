import 'package:csv/csv.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class thirdGraphStatistics extends StatefulWidget {
  const thirdGraphStatistics({Key key}) : super(key: key);

  @override
  _thirdGraphStatisticsState createState() => _thirdGraphStatisticsState();
}

class _thirdGraphStatisticsState extends State<thirdGraphStatistics> {
  List<List<dynamic>> _dataToDisplay = [];
  List<_SalesData> data = [];

  void _loadCSV() async {
    final _rawData = await rootBundle.loadString("USA_death.csv");
    List<List<dynamic>> _listData = CsvToListConverter().convert(_rawData);
    setState(() {
      _dataToDisplay = _listData;
    });

    for (int i = 0; i < _dataToDisplay.length; i++) {
      data.add(_SalesData(_dataToDisplay[i][0], _dataToDisplay[i][1]));
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _loadCSV();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CupertinoColors.darkBackgroundGray,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          //Initialize the chart widget
          Flexible(
            child: Container(
              height: 600,
              alignment: Alignment.center,
              child: SfCartesianChart(
                zoomPanBehavior: ZoomPanBehavior(
                  enableDoubleTapZooming: true,
                  enablePinching: true,
                  enableMouseWheelZooming: true,
                  enablePanning: true,
                ),
                primaryXAxis: CategoryAxis(
                  labelRotation: 90,
                  labelStyle: TextStyle(
                      color: Colors.white,
                      fontFamily: 'Roboto',
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.w200),
                ),

                // Chart title
                title: ChartTitle(
                  text: 'USA DEATH HISTORY',
                  textStyle: TextStyle(color: CupertinoColors.white),
                ),
                // Enable legend
                legend: Legend(isVisible: false),
                // Enable tooltip
                tooltipBehavior: TooltipBehavior(enable: true),
                series: <ChartSeries<_SalesData, String>>[
                  LineSeries<_SalesData, String>(
                      width: 5,
                      color: CupertinoColors.destructiveRed,
                      dataSource: data,
                      xValueMapper: (_SalesData sales, _) => sales.year,
                      yValueMapper: (_SalesData sales, _) => sales.sales,
                      // Enable data label
                      dataLabelSettings: DataLabelSettings(isVisible: false))
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _SalesData {
  _SalesData(this.year, this.sales);

  final String year;
  final int sales;
}
