import 'package:covid19app/pages/Latest_statistics.dart';
import 'package:flutter/cupertino.dart';


void main() {
  runApp(
    new CupertinoApp(



      debugShowCheckedModeBanner: false,

      title: 'USA COVID-19 Coronavirus Statistics',

      theme: CupertinoThemeData(


        textTheme: CupertinoTextThemeData(


        ),



      ),


      home: lastest_state(),
    ),
  );
}