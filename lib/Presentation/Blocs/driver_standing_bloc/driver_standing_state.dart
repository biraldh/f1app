part of 'driver_standing_bloc.dart';

@immutable
sealed class DriverStandingState {}

final class DriverStandingInitial extends DriverStandingState {
  DriverStandingInitial();
}

class DriverStandingGetLoading extends DriverStandingState{
  DriverStandingGetLoading();
}

class DriverStandingGetSuccess extends DriverStandingState{
  final List<DriverStandingInfo> standing;
  DriverStandingGetSuccess(this.standing);
}

class DriverStandingGetFailure extends DriverStandingState{
  DriverStandingGetFailure();
}
