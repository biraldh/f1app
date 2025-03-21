part of 'driver_info_race_bloc.dart';

@immutable
sealed class DriverInfoRaceEvent {}

class DriverInfoRaceGet extends DriverInfoRaceEvent{
  String driverId;
  String year;
  DriverInfoRaceGet(this.driverId, this.year);
}