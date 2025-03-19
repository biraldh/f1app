import 'package:bloc/bloc.dart';
import 'package:footballapp/Data/Model/driver_standing_info.dart';
import 'package:footballapp/Data/Repository/driver_standing_data.dart';
import 'package:meta/meta.dart';


part 'driver_standing_event.dart';
part 'driver_standing_state.dart';

class DriverStandingBloc extends Bloc<DriverStandingEvent, DriverStandingState> {
  DriverStandingData dsd;
  DriverStandingBloc(this.dsd) : super(DriverStandingInitial()) {
    on<DriverStandingGet>((event, emit) async {
      try{
        emit(DriverStandingGetLoading());
        final response = await dsd.getDriverStanding();
        emit(DriverStandingGetSuccess(response));
      }
      catch(e){
        emit(DriverStandingGetFailure());
      }
    });
  }
}
