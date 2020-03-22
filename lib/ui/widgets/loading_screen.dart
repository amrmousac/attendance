import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
class LoadingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300],
      highlightColor: Colors.grey[200],
      enabled: true,
      child: GridView.builder(

      itemCount: 5,
        itemBuilder: (context, index)=>Container(
        color: Colors.blue,
        height: 50.0,
        margin: EdgeInsets.all(8.0),
        padding: EdgeInsets.all(16.0),
        
      ),
        gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
    ),
    );
  }
}
