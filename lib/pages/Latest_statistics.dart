import 'package:csv/csv.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter/widgets.dart';
import 'package:hciprojectversion2/pages/statebystate.dart';
import 'package:url_launcher/url_launcher.dart';

import 'dataLiveFeature.dart';

class lastest_state extends StatefulWidget {
  @override
  _lastest_stateState createState() => _lastest_stateState();
}

class _lastest_stateState extends State<lastest_state> {
  List<List<dynamic>> _data = [];
  List<DataRow> dataForTable = [];

  // This function is triggered when the floating button is pressed
  void _loadCSV() async {
    final _rawData = await rootBundle.loadString("HCICSV.csv");
    List<List<dynamic>> _listData = CsvToListConverter().convert(_rawData);
    setState(() {
      _data = _listData;
    });

    for (int i = 0; i < _data.length; i++) {
      dataForTable.add(
        DataRow(
          cells: <DataCell>[
            DataCell(
              Text(
                _data[i][1].toString(),
                style: TextStyle(
                  color: CupertinoColors.white,
                  fontWeight: FontWeight.w700,
                  fontFamily: 'SF',
                  fontSize: 18,
                ),
              ),
            ),
            DataCell(
              Text(
                _data[i][3].toString(),
                style: TextStyle(
                  color: CupertinoColors.white,
                  fontWeight: FontWeight.w700,
                  fontFamily: 'SF',
                  fontSize: 18,
                ),
              ),
            ),
            DataCell(
              Text(
                _data[i][4].toString(),
                style: TextStyle(
                  color: CupertinoColors.white,
                  fontWeight: FontWeight.w700,
                  fontFamily: 'SF',
                  fontSize: 18,
                ),
              ),
            ),
            DataCell(
              Text(
                _data[i][5].toString(),
                style: TextStyle(
                  color: CupertinoColors.white,
                  fontWeight: FontWeight.w700,
                  fontFamily: 'SF',
                  fontSize: 18,
                ),
              ),
            ),
            DataCell(
              Text(
                _data[i][6].toString(),
                style: TextStyle(
                  color: CupertinoColors.white,
                  fontWeight: FontWeight.w700,
                  fontFamily: 'SF',
                  fontSize: 18,
                ),
              ),
            ),
            DataCell(
              Text(
                _data[i][7].toString(),
                style: TextStyle(
                  color: CupertinoColors.white,
                  fontWeight: FontWeight.w700,
                  fontFamily: 'SF',
                  fontSize: 18,
                ),
              ),
            ),
            DataCell(
              Text(
                _data[i][8].toString(),
                style: TextStyle(
                  color: CupertinoColors.white,
                  fontWeight: FontWeight.w700,
                  fontFamily: 'SF',
                  fontSize: 18,
                ),
              ),
            ),
          ],
        ),
      );
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
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xff292929),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              dataLiveFuture(),
              Container(
                margin: EdgeInsets.only(
                    left: 20.0, top: 10.0, right: 20.0, bottom: 10.0),
                decoration: BoxDecoration(
                  color: Color(0xff3A3A3C),
                  borderRadius: BorderRadius.circular(10),
                ),
                padding: EdgeInsets.symmetric(vertical: 14, horizontal: 20),
                width: MediaQuery.of(context).size.width,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      "COVID Cases State by State",
                      style: TextStyle(
                        color: CupertinoColors.white,
                        fontWeight: FontWeight.w900,
                        fontFamily: "SF",
                        fontSize: 20,
                      ),
                    ),
                    Container(
                      padding:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                      decoration: BoxDecoration(
                        color: CupertinoColors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: TextButton(
                        onPressed: () {
                          _launchURLG1();
                        },
                        child: Text(
                          'Go',
                          style: TextStyle(
                            color: CupertinoColors.black,
                            fontWeight: FontWeight.w900,
                            fontFamily: "SF",
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                    left: 20.0, top: 10.0, right: 20.0, bottom: 10.0),
                decoration: BoxDecoration(
                  color: Color(0xff3A3A3C),
                  borderRadius: BorderRadius.circular(10),
                ),
                padding: EdgeInsets.symmetric(vertical: 14, horizontal: 20),
                width: MediaQuery.of(context).size.width,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      "Historic pharmaceutical companies",
                      style: TextStyle(
                        color: CupertinoColors.white,
                        fontWeight: FontWeight.w900,
                        fontFamily: "SF",
                        fontSize: 20,
                      ),
                    ),
                    Container(
                      padding:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                      decoration: BoxDecoration(
                        color: CupertinoColors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: TextButton(
                        onPressed: () {
                          _launchURLG2();
                        },
                        child: Text(
                          'Go',
                          style: TextStyle(
                            color: CupertinoColors.black,
                            fontWeight: FontWeight.w900,
                            fontFamily: "SF",
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                    left: 20.0, top: 10.0, right: 20.0, bottom: 10.0),
                decoration: BoxDecoration(
                  color: Color(0xff3A3A3C),
                  borderRadius: BorderRadius.circular(10),
                ),
                padding: EdgeInsets.symmetric(vertical: 14, horizontal: 20),
                width: MediaQuery.of(context).size.width,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      "Vaccination's Percentage",
                      style: TextStyle(
                        color: CupertinoColors.white,
                        fontWeight: FontWeight.w900,
                        fontFamily: "SF",
                        fontSize: 20,
                      ),
                    ),
                    Container(
                      padding:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                      decoration: BoxDecoration(
                        color: CupertinoColors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: TextButton(
                        onPressed: () {
                          _launchURLG3();
                        },
                        child: Text(
                          'Go',
                          style: TextStyle(
                            color: CupertinoColors.black,
                            fontWeight: FontWeight.w900,
                            fontFamily: "SF",
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                    left: 20.0, top: 10.0, right: 20.0, bottom: 10.0),
                decoration: BoxDecoration(
                  color: Color(0xff3A3A3C),
                  borderRadius: BorderRadius.circular(10),
                ),
                padding: EdgeInsets.symmetric(vertical: 14, horizontal: 20),
                width: MediaQuery.of(context).size.width,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      "Report Dead Vaccinations",
                      style: TextStyle(
                        color: CupertinoColors.white,
                        fontWeight: FontWeight.w900,
                        fontFamily: "SF",
                        fontSize: 20,
                      ),
                    ),
                    Container(
                      padding:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                      decoration: BoxDecoration(
                        color: CupertinoColors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: TextButton(
                        onPressed: () {
                          _launchURLG4();
                        },
                        child: Text(
                          'Go',
                          style: TextStyle(
                            color: CupertinoColors.black,
                            fontWeight: FontWeight.w900,
                            fontFamily: "SF",
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                    left: 20.0, top: 10.0, right: 20.0, bottom: 10.0),
                decoration: BoxDecoration(
                  color: Color(0xff3A3A3C),
                  borderRadius: BorderRadius.circular(10),
                ),
                padding: EdgeInsets.symmetric(vertical: 14, horizontal: 20),
                width: MediaQuery.of(context).size.width,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      "COVID Cases by State",
                      style: TextStyle(
                        color: CupertinoColors.white,
                        fontWeight: FontWeight.w900,
                        fontFamily: "SF",
                        fontSize: 20,
                      ),
                    ),
                    Container(
                      padding:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                      decoration: BoxDecoration(
                        color: CupertinoColors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: TextButton(
                        onPressed: () {
                          _launchURLG5();
                        },
                        child: Text(
                          'Go',
                          style: TextStyle(
                            color: CupertinoColors.black,
                            fontWeight: FontWeight.w900,
                            fontFamily: "SF",
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              statebystate(dataForTable: dataForTable),
            ],
          ),
        ),
      ),
    );
  }
}

/// Sample linear data type.
class LinearSales {
  final int year;
  final int sales;

  LinearSales(this.year, this.sales);
}

void _launchURLG1() async {
  launch("https://public.flourish.studio/visualisation/8247644/");
}

void _launchURLG2() async {
  launch("https://public.flourish.studio/visualisation/8244480/");
}

void _launchURLG3() async {
  launch("https://public.flourish.studio/visualisation/8251836/");
}

void _launchURLG4() async {
  launch("https://public.flourish.studio/visualisation/8252560/");
}

void _launchURLG5() async {
  launch("https://public.flourish.studio/visualisation/8318493/");
}

void _launchURLG6() async {
  launch("https://public.flourish.studio/visualisation/8318493/");
}
