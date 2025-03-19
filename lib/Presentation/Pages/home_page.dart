
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:footballapp/Data/Repository/constructor_standing_data.dart';
import 'package:footballapp/Data/Repository/driver_standing_data.dart';
import 'package:footballapp/Presentation/Blocs/driver_standing_bloc/driver_standing_bloc.dart';
import 'package:footballapp/Presentation/Pages/driver_standing_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  DriverStandingData drd = DriverStandingData();
  ConstructorStandingData csd = ConstructorStandingData();
  @override
  Widget build(BuildContext context) {
    double screenheight = MediaQuery.of(context).size.height;
    double screenwidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: Image.asset('assets/pngwing.com.png', color: Colors.white,),
      ),
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Standing', style: TextStyle(color: Colors.white, fontSize: 40),),
            InkWell(
              onTap: () => Navigator.pushNamed(context, '/driverstandingpage'),
              child: Container(
                height: screenheight/3,
                width: screenwidth,
                decoration: BoxDecoration(
                    color: Colors.white,
                  borderRadius: BorderRadius.circular(30)
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("Drivers", style: TextStyle(color: Colors.black, fontSize: 30, fontWeight: FontWeight.bold),),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Image.asset('assets/maxver.png', ),
                    )
                  ],
                ),
              ),
            ),
            InkWell(
              onTap: () => Navigator.pushNamed(context, '/constructorstandingpage'),
              child: Container(
                height: screenheight/3,
                width: screenwidth,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30)
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("Constructors", style: TextStyle(color: Colors.black, fontSize: 30, fontWeight: FontWeight.bold),),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 30),
                      child: SizedBox(
                          width: screenwidth/1,
                          child: Image.asset('assets/redf1.png', fit: BoxFit.cover,)),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
