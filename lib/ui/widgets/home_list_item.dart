

import 'package:attendance/core/sheets.dart';
import 'package:attendance/ui/sheet/sheet_screen.dart';
import 'package:flutter/material.dart';


class HomeListItem extends StatelessWidget {
  final String worksheetTitle;

  HomeListItem({this.worksheetTitle});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        SheetsController.currentWorksheetTitle = worksheetTitle;
        Navigator.push(context, MaterialPageRoute(builder: (context)=>SheetScreen()));
      },
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.bottomLeft,
              end:Alignment.topRight,

              colors: [ Colors.lightGreen,Colors.green,],
            ),
            boxShadow: [
              BoxShadow(
                  spreadRadius: 2.0,
                  blurRadius: 8.0,
                  color: Colors.grey)
            ]),
        margin: EdgeInsets.all(8.0),
        padding: EdgeInsets.all(16.0),
        child: Text(
          worksheetTitle,
          style: TextStyle(
              fontSize: 21.0,
              color: Colors.white,
              fontWeight: FontWeight.w900),
        ),
      ),
    );
  }
}
