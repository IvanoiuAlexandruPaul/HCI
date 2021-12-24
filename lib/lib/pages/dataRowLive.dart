import 'package:flutter/material.dart';

import 'dataWidget.dart';

class dataRowLive extends StatelessWidget {
  AsyncSnapshot data;

  dataRowLive(this.data);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        dataWidget(AssetImage('imgs/map.png'), 'All Cases',
            data.data.cases.toString(), Color(0xffFFD60A)),
        Container(
          width: 20,
        ),
        dataWidget(AssetImage('imgs/map.png'), 'Death',
            data.data.deaths.toString(), Color(0xffFF453A)),
        Container(
          width: 20,
        ),
        dataWidget(AssetImage('imgs/map.png'), 'Recovered',
            data.data.recovered.toString(), Color(0xff32D74B)),
        Container(
          width: 20,
        ),
        dataWidget(AssetImage('imgs/map.png'), 'Active',
            data.data.active.toString(), Color(0xffFF9F0A)),
        Container(
          width: 20,
        ),
        dataWidget(
          AssetImage('imgs/map.png'),
          'Critical',
          data.data.critical.toString(),
          Color(0xffFF2D55),
        ),
      ],
    );
  }
}
