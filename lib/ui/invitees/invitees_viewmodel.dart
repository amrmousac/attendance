
import 'package:attendance/core/models/cell_model.dart';
import 'package:attendance/core/sheets.dart';
import 'package:flutter/material.dart';
import 'package:gsheets/gsheets.dart';

class InviteesViewModel extends ChangeNotifier{

  Worksheet _worksheet;
  CellModel _cellModel;

  CellModel get cellModel => _cellModel;

  set cellModel(CellModel value) {
    _cellModel = value;
    notifyListeners();
  }

  Worksheet get worksheet => _worksheet;

  set worksheet(Worksheet value) {
    _worksheet = value;
    notifyListeners();
  }



  Future<void> getData (String title)async{
    worksheet = await SheetsController().getWorksheetByTitle();
    cellModel = CellModel(
      names: await worksheet.cells.column(1),
      status: await worksheet.cells.column(2),
      emails: await worksheet.cells.column(3),
    );
  }


}