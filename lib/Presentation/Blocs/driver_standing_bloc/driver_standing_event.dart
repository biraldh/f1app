part of 'driver_standing_bloc.dart';

@immutable
sealed class DriverStandingEvent {}

class DriverStandingGet extends DriverStandingEvent{
  String year;
  DriverStandingGet(this.year);
}