
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
  late String year = '2024';
  final ListWidget _lw = ListWidget();
  final TextEditingController _yearController = TextEditingController();
  @override
  void initState() {
    super.initState();
    context.read<DriverStandingBloc>().add(DriverStandingGet(year));
  }

  void updateYear(){
    setState(() {
      year = _yearController.text;
      context.read<DriverStandingBloc>().add(DriverStandingGet(year));
    });
  }
  @override
  Widget build(BuildContext context) {
    //double screenheight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        title: const Text('Driver Standings',style: TextStyle(color: Colors.white)), backgroundColor: Colors.black,),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
                width: screenWidth/2,
                child: SearchBar(hintText: 'Year', 
                  leading: IconButton(icon: Icon(Icons.search), color: Colors.white, onPressed: () => updateYear(),),
                  elevation: WidgetStateProperty.all(0),
                  hintStyle: WidgetStateProperty.all(
                    TextStyle(color: Colors.white),
                  ),
                  textStyle: WidgetStateProperty.all(
                      TextStyle(color: Colors.white)
                  ),
                  onSubmitted: (value) => updateYear(),
                  controller: _yearController,
                  backgroundColor: WidgetStateProperty.all(Colors.red),
                )
            ),
          ),
          Expanded(
            child: BlocBuilder<DriverStandingBloc, DriverStandingState>(
              builder: (context, state) {
                if (state is DriverStandingGetLoading) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state is DriverStandingGetSuccess) {
                  var standing = state.standing.toList();
                  return ListView.builder(
                    itemCount: standing.length,
                    itemBuilder: (context, index) {
                      var driverInfo = standing[index];
                      return InkWell(
                        onTap: () => Navigator.pushNamed(context, '/driverdetail', arguments: {'driverId' : driverInfo.driverId, 'year' : year, 'driverName':driverInfo.driverName }) ,
                        child: _lw.displaystandings(driverInfo.position, driverInfo.driverName, driverInfo.points));
                    },
                  );
                } else if (state is DriverStandingGetFailure) {
                  return const Center(child: Text('Failed to load standings.',style: TextStyle(color: Colors.white)));
                }
                return const Center(child: Text('No data available.',style: TextStyle(color: Colors.white)));
              },
            ),
          ),
        ],
      ),
    );
  }
}
