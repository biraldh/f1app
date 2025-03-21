part of 'driver_info_race_bloc.dart';

@immutable
sealed class DriverInfoRaceState {}

final class DriverInfoRaceInitial extends DriverInfoRaceState {}

class DriverInfoRaceLoading extends DriverInfoRaceState{
  DriverInfoRaceLoading();
}
class DriverInfoRaceSuccess extends DriverInfoRaceState{
  List<DriverInfoPerRace> driverinfo;
  DriverInfoRaceSuccess({required this.driverinfo});
}
class DriverInfoRaceFailure extends DriverInfoRaceState{
  DriverInfoRaceFailure();
}
