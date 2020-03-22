
import 'package:attendance/core/sheets.dart';
import 'package:attendance/ui/invitees/invitees_screen.dart';
import 'package:attendance/ui/scan/scan_screen.dart';
import 'package:attendance/ui/widgets/sheet_tabbar.dart';
import 'package:flutter/material.dart';
class SheetScreen extends StatelessWidget {



  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text(SheetsController.currentWorksheetTitle),

          bottom: sheetTabBar(),
        ),
        body: TabBarView(
          physics: BouncingScrollPhysics(),
          children: <Widget>[
            InviteesScreen(),
            ScanScreen(),
          ],
        ),
      ),
    );
  }
}
