
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:footballapp/Presentation/Blocs/driver_info_per_race_bloc/driver_info_race_bloc.dart';

class DriverDetail extends StatefulWidget {
  final String driverId;
  final String year;
  final String driverName;
  const DriverDetail({super.key, required this.driverId, required this.year, required this.driverName});

  @override
  State<DriverDetail> createState() => _DriverDetailState();
}

class _DriverDetailState extends State<DriverDetail> {

  @override
  void initState() {
    context.read<DriverInfoRaceBloc>().add(DriverInfoRaceGet(driverId: widget.driverId, year: widget.year));
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return
      Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.black,
          iconTheme: IconThemeData(
            color: Colors.white
          ),
          title: Text(widget.driverName, style: TextStyle(color: Colors.white),),
        ),
        body: BlocBuilder<DriverInfoRaceBloc, DriverInfoRaceState>(
          builder: (context, state){
            if( state is DriverInfoRaceLoading){
              return const Center(child: CircularProgressIndicator(),);
            }
            else if( state is DriverInfoRaceFailure){
              return const Center(child: Text('Something Went Wrong'));
            }
            else if(state is DriverInfoRaceSuccess){
              var raceResults = state.driverinfo.toList();
              return ListView.builder(
                itemCount: raceResults.length,
                itemBuilder: (context, index){
                  var raceResult = raceResults[index];
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      decoration:  BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Colors.white
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(raceResult.trackName, style: TextStyle(fontSize: 30),),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('Position: ${raceResult.driverPosition}',style: TextStyle(fontSize: 25)),
                                Text('Points: ${raceResult.points}',style: TextStyle(fontSize: 25)),
                              ],
                            ),
                            Text('Fastestlap ${raceResult.fastestLap}',style: TextStyle(fontSize: 25))
                          ],
                        ),
                      ),
                    ),
                  );
                }
              );
            }
            return const Center(child: Text("No Data Available"));
          }
        ),
      );
  }
}
