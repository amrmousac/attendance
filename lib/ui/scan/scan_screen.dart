
import 'package:attendance/ui/scan/scan_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider_architecture/provider_architecture.dart';

class ScanScreen extends StatelessWidget {
  final String worksheetTitle;

  const ScanScreen({this.worksheetTitle});
  @override
  Widget build(BuildContext context) {
    return ViewModelProvider<ScanViewModel>.withConsumer(
      onModelReady: (model) {
      },
      viewModel: ScanViewModel(),
      builder: (context, model, child) => Scaffold(
       body: Center(
          child: Text('SCAN'),
        ),
        floatingActionButton: FloatingActionButton.extended(onPressed: ()=>model.scanQR(context,worksheetTitle), label: Text('SCAN'),icon: Icon(Icons.camera_alt,color: Colors.white,),backgroundColor: Colors.lightGreen,),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      ),
    );
  }
}
