import 'package:gsheets/gsheets.dart';
import './auth.dart' as auth;
class SheetsController{

  static Spreadsheet _spreadsheet;
  static String _currentWorksheetTitle;

  static String get currentWorksheetTitle => _currentWorksheetTitle;

  static set currentWorksheetTitle(String value) {
    _currentWorksheetTitle = value;
  }

  Future<Spreadsheet> get spreadsheet async {
    if (_spreadsheet != null) return _spreadsheet;
    else
      _spreadsheet = await connect();
    return _spreadsheet;
  }


  Future<Spreadsheet> connect() async{
    final gsheets = GSheets(auth.credentials);
    final ss = await gsheets.spreadsheet(auth.spreadsheetId);
    return ss;
  }

  Future<List<Worksheet>> listSheets()async {
    final ss = await spreadsheet;
    return ss.sheets;
  }

  Future<Worksheet> getWorksheetByTitle()async{
    final ss = await spreadsheet;
    return ss.worksheetByTitle(currentWorksheetTitle);
  }

}