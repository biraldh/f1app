
import 'package:flutter/material.dart';
import 'package:footballapp/Data/Repository/driver_info_per_race_data.dart';

class DriverDetail extends StatefulWidget {
  final String driverId;
  const DriverDetail({super.key, required this.driverId});

  @override
  State<DriverDetail> createState() => _DriverDetailState();
}

class _DriverDetailState extends State<DriverDetail> {
  final DriverInfoPerRaceData  _diprd  = DriverInfoPerRaceData();
  @override
  Widget build(BuildContext context) {
    return
      Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          iconTheme: IconThemeData(
            color: Colors.white
          ),
          title: Text('Race Results', style: TextStyle(color: Colors.white),),
        ),
      );
  }
}
