import 'package:csv/csv.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class firstGraphStatistics extends StatefulWidget {
  // ignore: prefer_const_constructors_in_immutables
  firstGraphStatistics({Key key}) : super(key: key);

  @override
  _firstGraphStatisticsState createState() => _firstGraphStatisticsState();
}

class _firstGraphStatisticsState extends State<firstGraphStatistics> {
  List<List<dynamic>> _dataToDisplay = [];
  List<List<dynamic>> _dataToDisplay2 = [];

  List<_SalesData> data = [];
  List<_SalesData> data2 = [];

  void _loadCSV() async {
    final _rawData = await rootBundle.loadString("USA_cases.csv");
    List<List<dynamic>> _listData = CsvToListConverter().convert(_rawData);
    setState(() {
      _dataToDisplay = _listData;
    });

    for (int i = 0; i < _dataToDisplay.length; i++) {
      data.add(_SalesData(_dataToDisplay[i][0], _dataToDisplay[i][1]));
    }
  }

  void _loadCSV2() async {
    final _rawData2 = await rootBundle.loadString("USA_caseslive.csv");
    List<List<dynamic>> _listData2 = CsvToListConverter().convert(_rawData2);
    setState(() {
      _dataToDisplay2 = _listData2;
    });

    for (int i = 0; i < _dataToDisplay2.length; i++) {
      data2.add(_SalesData(_dataToDisplay2[i][0], _dataToDisplay2[i][1]));
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _loadCSV();
    _loadCSV2();
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
              margin: EdgeInsets.only(
                  left: 20.0, top: 10.0, right: 20.0, bottom: 10.0),
              decoration: BoxDecoration(
                color: Color(0xff292929),
                borderRadius: BorderRadius.circular(10),
              ),
              height: MediaQuery.of(context).size.height / 2,
              width: MediaQuery.of(context).size.width,
              child: SfCartesianChart(
                plotAreaBackgroundColor: Colors.black12,
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
                      fontFamily: 'SF',
                      fontSize: 18,
                      fontWeight: FontWeight.w800),
                ),

                // Chart title
                title: ChartTitle(
                  text: 'USA HISTORICAL CASES',
                  textStyle: TextStyle(
                      color: Colors.white,
                      fontFamily: 'SF',
                      fontSize: 40,
                      fontWeight: FontWeight.w800),
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
          SizedBox(
            height: 25,
          ),
          Flexible(
            child: Container(
              margin: EdgeInsets.only(
                  left: 20.0, top: 10.0, right: 20.0, bottom: 10.0),
              decoration: BoxDecoration(
                color: Color(0xff292929),
                borderRadius: BorderRadius.circular(10),
              ),
              height: MediaQuery.of(context).size.height / 2,
              width: MediaQuery.of(context).size.width,
              child: SfCartesianChart(
                plotAreaBackgroundColor: Colors.black12,
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
                      fontFamily: 'SF',
                      fontSize: 18,
                      fontWeight: FontWeight.w800),
                ),
                primaryYAxis: CategoryAxis(
                  labelStyle: TextStyle(
                      color: Colors.white,
                      fontFamily: 'SF',
                      fontSize: 20,
                      fontWeight: FontWeight.w500),
                ),

                // Chart title
                title: ChartTitle(
                  text: 'USA DAILY CASES',
                  textStyle: TextStyle(
                      color: Colors.white,
                      fontFamily: 'SF',
                      fontSize: 40,
                      fontWeight: FontWeight.w800),
                ),
                // Enable legend
                legend: Legend(isVisible: false),
                // Enable tooltip
                tooltipBehavior: TooltipBehavior(enable: true),
                series: <ChartSeries<_SalesData, String>>[
                  LineSeries<_SalesData, String>(
                      width: 5,
                      color: CupertinoColors.destructiveRed,
                      dataSource: data2,
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
