
import 'package:attendance/core/sheets.dart';
import 'package:flutter/material.dart';
import 'package:gsheets/gsheets.dart';


class HomeViewModel extends ChangeNotifier{

  Future<List<Worksheet>> _worksheets = SheetsController().listSheets();

  Future<List<Worksheet>> get worksheets => _worksheets;

  set worksheets(Future<List<Worksheet>> value) {
    _worksheets = value;
    notifyListeners();
  }


}