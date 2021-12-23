import 'package:csv/csv.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class forthGraphStatistics extends StatefulWidget {
  forthGraphStatistics({Key key}) : super(key: key);

  @override
  _forthGraphStatisticsState createState() => _forthGraphStatisticsState();
}

class _forthGraphStatisticsState extends State<forthGraphStatistics> {
  TooltipBehavior _tooltipBehavior;
  List<List<dynamic>> _data = [];
  List<DataRow> dataForTable = [];
  List<ExpenseData> chartData = [];
  List<_ChartData> data;
  TooltipBehavior _tooltip;

  void _loadCSV3() async {
    final _rawData = await rootBundle.loadString("vaccompanies.csv");
    List<List<dynamic>> _listData = CsvToListConverter().convert(_rawData);
    setState(() {
      _data = _listData;
    });

    for (int i = 0; i < _data.length; i++) {
      chartData
          .add(ExpenseData(_data[i][0], _data[i][1], _data[i][2], _data[i][3]));
    }
  }

  @override
  void initState() {
    _loadCSV3();
    data = [
      _ChartData('Fully Vaccinated', 202358902),
      _ChartData('At least one dose', 241571082),
      _ChartData('Death', 804266),
    ];
    _tooltipBehavior = TooltipBehavior(enable: true);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: CupertinoColors.darkBackgroundGray,
        body: Column(
          children: [
            Container(
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
                title: ChartTitle(
                  text: 'USA VACCINATION COMPANIES',
                  textStyle: TextStyle(
                      color: Colors.white,
                      fontFamily: 'SF',
                      fontSize: 25,
                      fontWeight: FontWeight.w800),
                ),
                legend: Legend(
                  isVisible: true,
                  textStyle: TextStyle(
                      color: Colors.white,
                      fontFamily: 'SF',
                      fontSize: 25,
                      fontWeight: FontWeight.w800),
                ),
                tooltipBehavior: _tooltipBehavior,
                series: <ChartSeries>[
                  StackedArea100Series<ExpenseData, String>(
                      dataSource: chartData,
                      xValueMapper: (ExpenseData exp, _) => exp.expenseCategory,
                      yValueMapper: (ExpenseData exp, _) => exp.father,
                      name: 'Pfizer/BioNTech',
                      markerSettings: MarkerSettings(
                        color: Colors.white,
                        isVisible: true,
                      )),
                  StackedArea100Series<ExpenseData, String>(
                      dataSource: chartData,
                      xValueMapper: (ExpenseData exp, _) => exp.expenseCategory,
                      yValueMapper: (ExpenseData exp, _) => exp.mother,
                      name: 'Moderna',
                      markerSettings: MarkerSettings(
                        color: Colors.white,
                        isVisible: true,
                      )),
                  StackedArea100Series<ExpenseData, String>(
                    dataSource: chartData,
                    xValueMapper: (ExpenseData exp, _) => exp.expenseCategory,
                    yValueMapper: (ExpenseData exp, _) => exp.son,
                    name: 'Johnson&Johnson',
                    markerSettings: MarkerSettings(
                      color: Colors.white,
                      isVisible: true,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ExpenseData {
  ExpenseData(this.expenseCategory, this.father, this.mother, this.son);
  final String expenseCategory;
  final num father;
  final num mother;
  final num son;
}

class _ChartData {
  _ChartData(this.x, this.y);

  final String x;
  final double y;
}
