import 'package:bloc/bloc.dart';
import 'package:footballapp/Data/Model/constructor_standing.dart';
import 'package:footballapp/Data/Repository/constructor_standing_data.dart';
import 'package:meta/meta.dart';

part 'constructor_standing_event.dart';
part 'constructor_standing_state.dart';

class ConstructorStandingBloc extends Bloc<ConstructorStandingEvent, ConstructorStandingState> {
  ConstructorStandingData csd;
  ConstructorStandingBloc(this.csd) : super(ConstructorStandingInitial()) {
    on<ConstructorStandingGet>((event, emit) async {
      try{
        emit(ConstructorStandingGetLoading());
        final response = await csd.getConstructorStanding(event.year);
        emit(ConstructorStandingGetSuccess(response));
      }catch(e){
        emit(ConstructorStandingGetFailure());
      }
    });
  }
}
