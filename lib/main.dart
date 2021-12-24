import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hciprojectversion2/pages/Latest_statistics.dart';

void main() {
  runApp(GetMaterialApp(
    home: lastest_state(),
    debugShowCheckedModeBanner: false,
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'COVID19USA.com',
    );
  }
}
