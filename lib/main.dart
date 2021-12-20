import 'package:covid19app/pages/Latest_statistics.dart';
import 'package:covid19app/pages/fifthGraphStatistics.dart';
import 'package:covid19app/pages/firstGraphStatistics.dart';
import 'package:covid19app/pages/forthGraphStatistics.dart';
import 'package:covid19app/pages/secondGraphStatistics.dart';
import 'package:covid19app/pages/thirdGraphStatistics.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(GetMaterialApp(
    home: lastest_state(),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'COVID19USA.com',
      routes: {
        '/': (context) => lastest_state(),
        'firstGraphStatistics': (context) => firstGraphStatistics(),
        'secondGraphStatistics': (context) => secondGraphStatistics(),
        'thirdGraphStatistics': (context) => thirdGraphStatistics(),
        'forthGraphStatistics': (context) => forthGraphStatistics(),
        'fifthGraphStatistics': (context) => fifthGraphStatistics(),
      },
    );
  }
}
