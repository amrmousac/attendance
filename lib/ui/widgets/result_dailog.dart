import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
 resultDialog (BuildContext context,IconData icon,Color color, String result) {
  return showDialog(
      context: context,
      barrierDismissible: true,
      builder: (_) =>
          CupertinoAlertDialog(
            title: Icon(icon, color: color, size: 42.0,),
            content: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(result, style: TextStyle(fontSize: 21.0),),
            ),
          )
  );
}