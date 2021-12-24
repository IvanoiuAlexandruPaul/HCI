import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hciprojectversion2/pages/myiconfiles.dart';
import 'package:hciprojectversion2/pages/usadata.dart';

import 'dataRowLive.dart';

class dataLiveFuture extends StatelessWidget {
  const dataLiveFuture({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: fetchCasesUSA(),
      builder: (context, AsyncSnapshot<UsaData> snapshot) {
        if (snapshot.hasData) {
          var usaCases = snapshot.data;
          return Container(
            margin: EdgeInsets.only(top: 40, left: 20, right: 20, bottom: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Color(0xff3A3A3C),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  margin: EdgeInsets.only(bottom: 10),
                  child: Text(
                    "USA - COVID19",
                    style: TextStyle(
                        color: Color(0xffffffff),
                        fontSize: 60,
                        fontWeight: FontWeight.w900,
                        fontFamily: "SF"),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                dataRowLive(snapshot),
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
                        color: CupertinoColors.label.resolveFrom(context),
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
          margin: EdgeInsets.only(top: 40, left: 20, right: 20, bottom: 10),
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
                padding: EdgeInsets.symmetric(vertical: 14, horizontal: 20),
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
                      padding:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 20),
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
    );
  }
}
