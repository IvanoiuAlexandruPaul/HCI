import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
        height: 150,
        decoration: BoxDecoration(
          color: colors,
          borderRadius: BorderRadius.circular(10),
        ),
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 5),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              nameToDisplay,
              style: TextStyle(
                  color: Color(0xff000000),
                  fontWeight: FontWeight.w600,
                  fontSize: 40,
                  fontFamily: 'SF'),
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
                    fontWeight: FontWeight.w900,
                    color: CupertinoColors.black,
                    fontFamily: 'SF'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
