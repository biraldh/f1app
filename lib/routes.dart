import 'package:flutter/material.dart';
import 'package:footballapp/Presentation/Pages/constructor_standing_page.dart';
import 'package:footballapp/Presentation/Pages/driver_standing_page.dart';

class RouteGen {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/driverstandingpage':
        return MaterialPageRoute(builder: (_) => DriverStandingPage());
      case '/constructorstandingpage':
        return MaterialPageRoute(builder: (_) => ConstructorStandingPage());
      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Error'),
        ),
        body: const Center(
          child: Text('ERROR'),
        ),
      );
    });
  }
}