import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
void showInviteeInfo(context,{String name,String status,String email}) {
  showDialog(
      context: context,
      barrierDismissible: true,
      builder: (_)=>CupertinoAlertDialog(
        title: Text(name),
        content: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,

            children: <Widget>[

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('Year: $email', style: TextStyle(fontSize: 16.0, )),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('Status: $status', style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w700),),
              ),

            ],
          ),
        ),
      )
  );
}