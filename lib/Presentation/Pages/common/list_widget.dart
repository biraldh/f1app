import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ListWidget{
  Widget displaystandings(position, driverName, points){
    return Card(
      color: Colors.white,
      child: ListTile(
        title: Text('$position. $driverName', style: TextStyle(fontSize: 30),),
        subtitle: Text('Points: $points',style: TextStyle(fontSize: 25, color: Colors.grey)),
      ),
    );
  }
}