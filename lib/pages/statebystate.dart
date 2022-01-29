import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class statebystate extends StatelessWidget {
  const statebystate({
    Key key,
    @required this.dataForTable,
  }) : super(key: key);

  final List<DataRow> dataForTable;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 20, right: 20, bottom: 10),
      decoration: BoxDecoration(
        color: Color(0xff1C1C1E),
        borderRadius: BorderRadius.circular(15),
      ),
      child: SizedBox(
        height: MediaQuery.of(context).size.width,
        width: MediaQuery.of(context).size.width,
        child: Center(
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Theme(
                data: Theme.of(context)
                    .copyWith(dividerColor: CupertinoColors.white),
                child: DataTable(
                  columnSpacing: 180,
                  columns: const <DataColumn>[
                    DataColumn(
                      label: Text(
                        'State Name',
                        style: TextStyle(
                          color: CupertinoColors.white,
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.w800,
                          fontSize: 25,
                        ),
                      ),
                    ),
                    DataColumn(
                      label: Text(
                        'Cases',
                        style: TextStyle(
                          color: CupertinoColors.white,
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.w800,
                          fontSize: 25,
                        ),
                      ),
                    ),
                    DataColumn(
                      label: Text(
                        'Death',
                        style: TextStyle(
                          color: CupertinoColors.white,
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.w800,
                          fontSize: 25,
                        ),
                      ),
                    ),
                    DataColumn(
                      label: Text(
                        'Confirmed Cases',
                        style: TextStyle(
                          color: CupertinoColors.white,
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.w800,
                          fontSize: 25,
                        ),
                      ),
                    ),
                    DataColumn(
                      label: Text(
                        'Confirmed Death',
                        style: TextStyle(
                          color: CupertinoColors.white,
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.w800,
                          fontSize: 25,
                        ),
                      ),
                    ),
                    DataColumn(
                      label: Text(
                        'Probable cases',
                        style: TextStyle(
                          color: CupertinoColors.white,
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.w800,
                          fontSize: 25,
                        ),
                      ),
                    ),
                    DataColumn(
                      label: Text(
                        'Probable Death',
                        style: TextStyle(
                          color: CupertinoColors.white,
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.w800,
                          fontSize: 25,
                        ),
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
    );
  }
}
