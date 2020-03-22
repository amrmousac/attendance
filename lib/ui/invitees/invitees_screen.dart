
import 'package:attendance/ui/invitees/invitees_viewmodel.dart';
import 'package:attendance/ui/widgets/show_invitee_info.dart';
import 'package:flutter/material.dart';
import 'package:provider_architecture/provider_architecture.dart';
class InviteesScreen extends StatelessWidget {
  final String worksheetTitle;

  const InviteesScreen({this.worksheetTitle}) ;
  @override
  Widget build(BuildContext context) {
    return ViewModelProvider<InviteesViewModel>.withConsumer(
      onModelReady: (model){

        model.getData(worksheetTitle);
      },
    viewModel: InviteesViewModel(),
    builder: (context, model, child) =>Scaffold(
      body: (model.cellModel ==null)?
          Center(child: CircularProgressIndicator(
            backgroundColor: Colors.green,

          ))
            : ListView.builder(
          physics: BouncingScrollPhysics(),
          itemCount: model.cellModel.emails.length,
          itemBuilder: (context,index){
            return (index>0)?InkWell(
              onTap: ()=>showInviteeInfo(context,
                  name:  model.cellModel.names[index].value,
                  email:  model.cellModel.emails[index].value,
                  status:  model.cellModel.status[index].value,
                 ),
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black26,
                          spreadRadius: 1.0,
                          blurRadius: 8.0
                      )
                    ]
                ),
                margin: EdgeInsets.all(8.0),
                padding: EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(model.cellModel.names[index].value, style: TextStyle(fontSize: 18.0),),
                        Text(model.cellModel.emails[index].value, style: TextStyle(fontSize: 18.0,color: Colors.grey),),
                      ],
                    ),
                    Icon(Icons.brightness_1,size: 16.0, color:(model.cellModel.status[index].value=='OK')?Colors.green:Colors.red),
                  ],
                ),
              ),
            ):Container();
          }),
    ),
    );
  }
}
