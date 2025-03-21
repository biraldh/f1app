import 'package:bloc/bloc.dart';
import 'package:footballapp/Data/Model/driver_info_per_race.dart';
import 'package:meta/meta.dart';

import '../../../Data/Repository/driver_info_per_race_data.dart';

part 'driver_info_race_event.dart';
part 'driver_info_race_state.dart';

class DriverInfoRaceBloc extends Bloc<DriverInfoRaceEvent, DriverInfoRaceState> {
  DriverInfoPerRaceData diprd;
  DriverInfoRaceBloc(this.diprd) : super(DriverInfoRaceInitial()) {
    on<DriverInfoRaceEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
