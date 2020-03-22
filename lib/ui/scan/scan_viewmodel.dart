
import 'package:attendance/core/models/cell_model.dart';
import 'package:attendance/core/sheets.dart';
import 'package:attendance/ui/widgets/result_dailog.dart';
import 'package:barcode_scan/barcode_scan.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gsheets/gsheets.dart';

class ScanViewModel extends ChangeNotifier{

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


  Future scanQR(context,String title) async{
    getData(title);
    String result  = ' ';
    try{
      String qrResult = await BarcodeScanner.scan();
      result = qrResult;
      bool isExist = false;

      for(int i = 0; i< cellModel.emails.length;i++){
        if(result == cellModel.emails[i].value){
          isExist = true;
          if(cellModel.status[i].value == 'OK'){
            return resultDialog(context,Icons.insert_emoticon, Colors.yellow, 'Already Scaned\n\n ${cellModel.names[i].value}');
          }else{
            final cell = await worksheet.cells.cell(column: 2, row: i+1);
            cell.post('OK');
            return resultDialog(context, Icons.check_circle,  Colors.green, '${cellModel.names[i].value}');
          }
        }
      }
      if(isExist== false){
        return  resultDialog(context,Icons.error,  Colors.red, 'Not Exist: $result');
      }

    }on PlatformException catch(e){
      if(e.code== BarcodeScanner.CameraAccessDenied){

      }else{

      }
    }on FormatException{


    }catch(e){

    }
  }


}