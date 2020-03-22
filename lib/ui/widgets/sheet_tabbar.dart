
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

Widget sheetTabBar ()=>TabBar(
    indicatorColor: Colors.transparent,
    isScrollable: true,
    dragStartBehavior: DragStartBehavior.start,
    unselectedLabelColor: Colors.black,
    labelColor: Colors.green,
    indicatorSize: TabBarIndicatorSize.label,
    tabs: <Widget>[
      Tab(
        child: Text(
          'Invitees',
          style:
          TextStyle(fontWeight: FontWeight.w700, fontSize: 21.0),
        ),
      ),
      Tab(
        child: Text(
          'SCAN',
          style:
          TextStyle(fontWeight: FontWeight.w700, fontSize: 21.0),
        ),
      ),

    ]);