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
