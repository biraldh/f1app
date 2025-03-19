part of 'constructor_standing_bloc.dart';

@immutable
sealed class ConstructorStandingState {}

final class ConstructorStandingInitial extends ConstructorStandingState {
  ConstructorStandingInitial();
}

class ConstructorStandingGetLoading extends ConstructorStandingState{
  ConstructorStandingGetLoading();
}

class ConstructorStandingGetSuccess extends ConstructorStandingState{
  final List<ConstructorStanding> standing;
  ConstructorStandingGetSuccess(this.standing);
}

class ConstructorStandingGetFailure extends ConstructorStandingState{
  ConstructorStandingGetFailure();
}