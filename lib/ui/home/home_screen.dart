
import 'package:attendance/ui/home/home_viewmodel.dart';
import 'package:attendance/ui/widgets/home_list_item.dart';
import 'package:attendance/ui/widgets/loading_screen.dart';
import 'package:flutter/material.dart';
import 'package:gsheets/gsheets.dart';
import 'package:provider_architecture/provider_architecture.dart';
class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return ViewModelProvider<HomeViewModel>.withConsumer(
      viewModel: HomeViewModel(),
      builder: (context, model, child) => Scaffold(
        appBar: AppBar(
          title: Text('Sheets', style: TextStyle(color: Colors.green),),
          centerTitle: true,
        ),
        body: FutureBuilder(
              future: model.worksheets,
              builder: (context, snapshot){

                  if (!snapshot.hasData) {
                      return LoadingScreen();
                  }
                  else {
                    List<Worksheet>worksheets = snapshot.data;
                    return GridView.builder(
                        gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
                        itemCount: worksheets.length,
                        itemBuilder: (context, index)=>HomeListItem(worksheetTitle: worksheets[index].title,)
                    );
                  }
                }
                ),
        ),
      );
  }
}
