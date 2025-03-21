import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:footballapp/Data/Repository/constructor_standing_data.dart';
import 'package:footballapp/Data/Repository/driver_standing_data.dart';
import 'package:footballapp/Presentation/Blocs/constructor_standing_bloc/constructor_standing_bloc.dart';
import 'package:footballapp/Presentation/Blocs/driver_info_per_race_bloc/driver_info_race_bloc.dart';
import 'package:footballapp/Presentation/Blocs/driver_standing_bloc/driver_standing_bloc.dart';
import 'package:footballapp/Presentation/Pages/home_page.dart';
import 'package:footballapp/routes.dart';
import 'package:lottie/lottie.dart';

import 'Data/Repository/driver_info_per_race_data.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers:[
        BlocProvider<DriverStandingBloc>(
          create:(context) => DriverStandingBloc(DriverStandingData()),
        ),
        BlocProvider<ConstructorStandingBloc>(
          create:(context) => ConstructorStandingBloc(ConstructorStandingData()),
        ),
        BlocProvider<DriverInfoRaceBloc>(
          create:(context) => DriverInfoRaceBloc(DriverInfoPerRaceData()),
        )
      ],
      child: MaterialApp(
        onGenerateRoute: RouteGen.generateRoute,
        debugShowCheckedModeBanner: false,
        home: AnimatedSplashScreen(
          splash: Lottie.asset('assets/splash_animation.json'),
          backgroundColor: Colors.black,
          nextScreen: HomePage(),
          splashIconSize: 250,
          duration: 3000,
          splashTransition: SplashTransition.fadeTransition,
        ),
      ),
    );
  }
}

