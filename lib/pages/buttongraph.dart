import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';

class buttongraph extends StatelessWidget {
  String textToDisplay;
  dynamic nameOfThePage;

  buttongraph(this.textToDisplay, this.nameOfThePage);

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Container(
        margin: EdgeInsets.only(bottom: 20),
        decoration: BoxDecoration(
          color: CupertinoColors.label.resolveFrom(context).withOpacity(0.12),
          borderRadius: BorderRadius.circular(10),
        ),
        padding: EdgeInsets.symmetric(vertical: 14, horizontal: 20),
        width: MediaQuery.of(context).size.width,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              textToDisplay,
              style: TextStyle(
                color: CupertinoColors.white.withOpacity(0.8),
                fontWeight: FontWeight.w700,
                fontSize: 20,
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              decoration: BoxDecoration(
                color: CupertinoColors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: TextButton(
                onPressed: () {
                  Get.to(nameOfThePage());
                },
                child: Text('Go'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
