import 'package:covid19app/icons/myiconsfile.dart';
import 'package:covid19app/pages/usadata.dart';
import 'package:csv/csv.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter/widgets.dart';

import 'usadata.dart';

class lastest_state extends StatefulWidget {
  @override
  _lastest_stateState createState() => _lastest_stateState();
}

class _lastest_stateState extends State<lastest_state> {
  List<List<dynamic>> _data = [];

  // This function is triggered when the floating button is pressed
  void _loadCSV() async {
    final _rawData = await rootBundle.loadString("HCICSV.csv");
    List<List<dynamic>> _listData = CsvToListConverter().convert(_rawData);
    setState(() {
      _data = _listData;
    });
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
                          ListView.builder(
                            scrollDirection: Axis.vertical,
                            shrinkWrap: true,
                            itemCount: _data.length,
                            itemBuilder: (_, index) {
                              return Container(
                                child: Card(
                                  margin: const EdgeInsets.all(3),
                                  color:
                                      index == 0 ? Colors.amber : Colors.white,
                                  child: ListTile(
                                    leading: Text(_data[index][1].toString()),
                                    title: Text(_data[index][3].toString()),
                                    trailing: Text(_data[index][5].toString()),
                                  ),
                                ),
                              );
                            },
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

class dataWidget extends StatelessWidget {
  String nameToDisplay;
  String valueToDisplay;
  AssetImage imageValue;
  Color colors;
  dataWidget(
      this.imageValue, this.nameToDisplay, this.valueToDisplay, this.colors);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
            color: colors,
            borderRadius: BorderRadius.circular(10),
            image: DecorationImage(
              image: imageValue,
              fit: BoxFit.cover,
            )),
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 5),
        child: Column(
          children: <Widget>[
            Text(
              nameToDisplay,
              style: TextStyle(
                color: CupertinoColors.white,
                fontWeight: FontWeight.w700,
                fontSize: 20,
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 10),
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              decoration: BoxDecoration(
                color: CupertinoColors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text(
                valueToDisplay,
                style: TextStyle(
                    fontWeight: FontWeight.w700, color: CupertinoColors.black),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
