import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../Blocs/driver_standing_bloc/driver_standing_bloc.dart';
import 'common/list_widget.dart';

class DriverStandingPage extends StatefulWidget {
  const DriverStandingPage({super.key});

  @override
  State<DriverStandingPage> createState() => _DriverStandingPageState();
}

class _DriverStandingPageState extends State<DriverStandingPage> {
  final ListWidget _lw = ListWidget();
  @override
  void initState() {
    super.initState();
    context.read<DriverStandingBloc>().add(DriverStandingGet());
  }

  @override
  Widget build(BuildContext context) {
    double screenheight = MediaQuery.of(context).size.height;
    double screenwidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Driver Standings',style: TextStyle(color: Colors.black)), backgroundColor: Colors.transparent,),
      body: BlocBuilder<DriverStandingBloc, DriverStandingState>(
        builder: (context, state) {
          if (state is DriverStandingGetLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is DriverStandingGetSuccess) {
            var standing = state.standing.toList();
            return ListView.builder(
              itemCount: standing.length,
              itemBuilder: (context, index) {
                var driverInfo = standing[index];
                return _lw.displaystandings(driverInfo.position, driverInfo.driverName, driverInfo.points);
              },
            );
          } else if (state is DriverStandingGetFailure) {
            return const Center(child: Text('Failed to load standings.',style: TextStyle(color: Colors.white)));
          }
          return const Center(child: Text('No data available.',style: TextStyle(color: Colors.white)));
        },
      ),
    );
  }
}
