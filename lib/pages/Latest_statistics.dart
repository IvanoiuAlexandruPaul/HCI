import 'package:covid19app/icons/myiconsfile.dart';
import 'package:covid19app/pages/forthGraphStatistics.dart';
import 'package:covid19app/pages/secondGraphStatistics.dart';
import 'package:covid19app/pages/thirdGraphStatistics.dart';
import 'package:covid19app/pages/usadata.dart';
import 'package:csv/csv.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter/widgets.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';

import 'dataWidget.dart';
import 'firstGraphStatistics.dart';
import 'usadata.dart';

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
                    color: CupertinoColors.white, fontWeight: FontWeight.w700),
              ),
            ),
            DataCell(
              Text(
                _data[i][3].toString(),
                style: TextStyle(
                    color: CupertinoColors.white, fontWeight: FontWeight.w700),
              ),
            ),
            DataCell(
              Text(
                _data[i][4].toString(),
                style: TextStyle(
                    color: CupertinoColors.white, fontWeight: FontWeight.w700),
              ),
            ),
            DataCell(
              Text(
                _data[i][5].toString(),
                style: TextStyle(
                    color: CupertinoColors.white, fontWeight: FontWeight.w700),
              ),
            ),
            DataCell(
              Text(
                _data[i][6].toString(),
                style: TextStyle(
                    color: CupertinoColors.white, fontWeight: FontWeight.w700),
              ),
            ),
            DataCell(
              Text(
                _data[i][7].toString(),
                style: TextStyle(
                    color: CupertinoColors.white, fontWeight: FontWeight.w700),
              ),
            ),
            DataCell(
              Text(
                _data[i][8].toString(),
                style: TextStyle(
                    color: CupertinoColors.white, fontWeight: FontWeight.w700),
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
        backgroundColor: CupertinoColors.darkBackgroundGray,
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              FutureBuilder(
                future: fetchCasesUSA(),
                builder: (context, AsyncSnapshot<UsaData> snapshot) {
                  if (snapshot.hasData) {
                    var usaCases = snapshot.data;
                    return Container(
                      margin: EdgeInsets.only(
                          top: 40, left: 20, right: 20, bottom: 10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            margin: EdgeInsets.only(bottom: 10),
                            child: Center(
                              child: Text(
                                "USA CASES COVID 19 DAILY DATA",
                                style: TextStyle(
                                  color: CupertinoColors.white,
                                  fontSize: 25,
                                  fontWeight: FontWeight.w700,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(bottom: 20),
                            decoration: BoxDecoration(
                                color: CupertinoColors.label
                                    .resolveFrom(context)
                                    .withOpacity(0.12),
                                borderRadius: BorderRadius.circular(10),
                                image: DecorationImage(
                                  image: AssetImage('imgs/map.png'),
                                  fit: BoxFit.cover,
                                )),
                            padding: EdgeInsets.symmetric(
                                vertical: 14, horizontal: 20),
                            width: MediaQuery.of(context).size.width,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text(
                                  "All cases",
                                  style: TextStyle(
                                    color:
                                        CupertinoColors.white.withOpacity(0.8),
                                    fontWeight: FontWeight.w700,
                                    fontSize: 20,
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.symmetric(
                                      vertical: 10, horizontal: 20),
                                  decoration: BoxDecoration(
                                    color: CupertinoColors.white,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Text(
                                    usaCases.cases.toString(),
                                    style: TextStyle(
                                        fontWeight: FontWeight.w700,
                                        color: CupertinoColors.black),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Row(
                            children: <Widget>[
                              dataWidget(
                                  AssetImage('imgs/map.png'),
                                  'Death',
                                  snapshot.data.deaths.toString(),
                                  CupertinoColors.activeGreen),
                              Container(
                                width: 20,
                              ),
                              dataWidget(
                                  AssetImage('imgs/map.png'),
                                  'Recovered',
                                  snapshot.data.recovered.toString(),
                                  CupertinoColors.activeOrange),
                            ],
                          ),
                          SizedBox(
                            height: 40,
                            width: 40,
                          ),
                          Row(
                            children: <Widget>[
                              dataWidget(
                                  AssetImage('imgs/map.png'),
                                  'Active',
                                  snapshot.data.active.toString(),
                                  CupertinoColors.activeBlue),
                              Container(
                                width: 20,
                              ),
                              dataWidget(
                                AssetImage('imgs/map.png'),
                                'Critical',
                                snapshot.data.critical.toString(),
                                CupertinoColors.destructiveRed,
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 40,
                            width: 40,
                          ),
                          SizedBox(
                            width: double.infinity,
                            child: SingleChildScrollView(
                              scrollDirection: Axis.vertical,
                              child: SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Center(
                                  child: Theme(
                                    data: Theme.of(context)
                                        .copyWith(dividerColor: Colors.white),
                                    child: DataTable(
                                      columnSpacing: 180,
                                      columns: const <DataColumn>[
                                        DataColumn(
                                          label: Text(
                                            'State Name',
                                            style: TextStyle(
                                                color: CupertinoColors.white,
                                                fontStyle: FontStyle.normal,
                                                fontWeight: FontWeight.w800),
                                          ),
                                        ),
                                        DataColumn(
                                          label: Text(
                                            'Cases',
                                            style: TextStyle(
                                                color: CupertinoColors.white,
                                                fontStyle: FontStyle.normal,
                                                fontWeight: FontWeight.w800),
                                          ),
                                        ),
                                        DataColumn(
                                          label: Text(
                                            'Death',
                                            style: TextStyle(
                                                color: CupertinoColors.white,
                                                fontStyle: FontStyle.normal,
                                                fontWeight: FontWeight.w800),
                                          ),
                                        ),
                                        DataColumn(
                                          label: Text(
                                            'Confirmed Cases',
                                            style: TextStyle(
                                                color: CupertinoColors.white,
                                                fontStyle: FontStyle.normal,
                                                fontWeight: FontWeight.w800),
                                          ),
                                        ),
                                        DataColumn(
                                          label: Text(
                                            'Confirmed Death',
                                            style: TextStyle(
                                                color: CupertinoColors.white,
                                                fontStyle: FontStyle.normal,
                                                fontWeight: FontWeight.w800),
                                          ),
                                        ),
                                        DataColumn(
                                          label: Text(
                                            'Propable cases',
                                            style: TextStyle(
                                                color: CupertinoColors.white,
                                                fontStyle: FontStyle.normal,
                                                fontWeight: FontWeight.w800),
                                          ),
                                        ),
                                        DataColumn(
                                          label: Text(
                                            'Propable Death',
                                            style: TextStyle(
                                                color: CupertinoColors.white,
                                                fontStyle: FontStyle.normal,
                                                fontWeight: FontWeight.w800),
                                          ),
                                        ),
                                      ],
                                      rows: dataForTable,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Container(
                            margin: EdgeInsets.only(bottom: 20),
                            decoration: BoxDecoration(
                                color: CupertinoColors.label
                                    .resolveFrom(context)
                                    .withOpacity(0.12),
                                borderRadius: BorderRadius.circular(10),
                                image: DecorationImage(
                                  image: AssetImage('imgs/map.png'),
                                  fit: BoxFit.cover,
                                )),
                            padding: EdgeInsets.symmetric(
                                vertical: 14, horizontal: 20),
                            width: MediaQuery.of(context).size.width,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text(
                                  "Total Cases | Daily Cases Graph",
                                  style: TextStyle(
                                    color:
                                        CupertinoColors.white.withOpacity(0.8),
                                    fontWeight: FontWeight.w700,
                                    fontSize: 20,
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.symmetric(
                                      vertical: 10, horizontal: 20),
                                  decoration: BoxDecoration(
                                    color: CupertinoColors.white,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: TextButton(
                                    onPressed: () {
                                      Get.to(firstGraphStatistics());
                                    },
                                    child: Text('Go'),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(bottom: 20),
                            decoration: BoxDecoration(
                                color: CupertinoColors.label
                                    .resolveFrom(context)
                                    .withOpacity(0.12),
                                borderRadius: BorderRadius.circular(10),
                                image: DecorationImage(
                                  image: AssetImage('imgs/map.png'),
                                  fit: BoxFit.cover,
                                )),
                            padding: EdgeInsets.symmetric(
                                vertical: 14, horizontal: 20),
                            width: MediaQuery.of(context).size.width,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text(
                                  "Hospitalized Graph",
                                  style: TextStyle(
                                    color:
                                        CupertinoColors.white.withOpacity(0.8),
                                    fontWeight: FontWeight.w700,
                                    fontSize: 20,
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.symmetric(
                                      vertical: 10, horizontal: 20),
                                  decoration: BoxDecoration(
                                    color: CupertinoColors.white,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: TextButton(
                                    onPressed: () {
                                      Get.to(secondGraphStatistics());
                                    },
                                    child: Text('Go'),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(bottom: 20),
                            decoration: BoxDecoration(
                                color: CupertinoColors.label
                                    .resolveFrom(context)
                                    .withOpacity(0.12),
                                borderRadius: BorderRadius.circular(10),
                                image: DecorationImage(
                                  image: AssetImage('imgs/map.png'),
                                  fit: BoxFit.cover,
                                )),
                            padding: EdgeInsets.symmetric(
                                vertical: 14, horizontal: 20),
                            width: MediaQuery.of(context).size.width,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text(
                                  "Death Graph",
                                  style: TextStyle(
                                    color:
                                        CupertinoColors.white.withOpacity(0.8),
                                    fontWeight: FontWeight.w700,
                                    fontSize: 20,
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.symmetric(
                                      vertical: 10, horizontal: 20),
                                  decoration: BoxDecoration(
                                    color: CupertinoColors.white,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: TextButton(
                                    onPressed: () {
                                      Get.to(thirdGraphStatistics());
                                    },
                                    child: Text('Go'),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(bottom: 20),
                            decoration: BoxDecoration(
                                color: CupertinoColors.label
                                    .resolveFrom(context)
                                    .withOpacity(0.12),
                                borderRadius: BorderRadius.circular(10),
                                image: DecorationImage(
                                  image: AssetImage('imgs/map.png'),
                                  fit: BoxFit.cover,
                                )),
                            padding: EdgeInsets.symmetric(
                                vertical: 14, horizontal: 20),
                            width: MediaQuery.of(context).size.width,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text(
                                  "Vaccinated Graph",
                                  style: TextStyle(
                                    color:
                                        CupertinoColors.white.withOpacity(0.8),
                                    fontWeight: FontWeight.w700,
                                    fontSize: 20,
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.symmetric(
                                      vertical: 10, horizontal: 20),
                                  decoration: BoxDecoration(
                                    color: CupertinoColors.white,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: TextButton(
                                    onPressed: () {
                                      Get.to(forthGraphStatistics());
                                    },
                                    child: Text('Go'),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  } else if (snapshot.hasError) {
                    return Container(
                      width: MediaQuery.of(context).size.width,
                      color: CupertinoColors.systemRed,
                      padding: EdgeInsets.all(20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            child: Icon(
                              MyFlutterApp.warning,
                              size: 30,
                              color: CupertinoColors.label.resolveFrom(context),
                            ),
                            margin: EdgeInsets.only(right: 10),
                          ),
                          Flexible(
                            child: Text(
                              "Please check your internet connection",
                              style: TextStyle(
                                  color: CupertinoColors.label
                                      .resolveFrom(context),
                                  fontWeight: FontWeight.w700),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2,
                            ),
                          ),
                        ],
                      ),
                    );
                  }

                  // By default, show a loading spinner.
                  return Container(
                    margin: EdgeInsets.only(
                        top: 40, left: 20, right: 20, bottom: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.only(bottom: 10),
                          width: 150,
                          height: 30,
                          decoration: BoxDecoration(
                            color: CupertinoColors.label
                                .resolveFrom(context)
                                .withOpacity(0.20),
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(bottom: 20),
                          decoration: BoxDecoration(
                            color: CupertinoColors.label
                                .resolveFrom(context)
                                .withOpacity(0.12),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          padding: EdgeInsets.symmetric(
                              vertical: 14, horizontal: 20),
                          width: MediaQuery.of(context).size.width,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Container(
                                width: 120,
                                height: 30,
                                decoration: BoxDecoration(
                                  color: CupertinoColors.label
                                      .resolveFrom(context)
                                      .withOpacity(0.20),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.symmetric(
                                    vertical: 10, horizontal: 20),
                                decoration: BoxDecoration(
                                  color: CupertinoColors.label
                                      .resolveFrom(context)
                                      .withOpacity(0.12),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Text(
                                  "    ",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      color: CupertinoColors.black),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
