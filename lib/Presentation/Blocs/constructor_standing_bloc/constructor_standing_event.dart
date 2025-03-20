part of 'constructor_standing_bloc.dart';

@immutable
sealed class ConstructorStandingEvent {}

class ConstructorStandingGet extends ConstructorStandingEvent{
  String year;
  ConstructorStandingGet(this.year);
}
