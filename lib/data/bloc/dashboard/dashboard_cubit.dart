import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:i2connect/data/injection/singleton.dart';
import 'package:i2connect/data/service/api_service.dart';
import 'package:i2connect/model/dashboard/important_people/important_people_model.dart';
import 'package:i2connect/model/dashboard/voterscount/voterscount_model.dart';

part 'dashboard_state.dart';

class DashboardCubit extends Cubit<DashboardState> {
  DashboardCubit() : super(DashboardState.initial());

  void initialize() {
    getVotersCount();
    getImportantPeople();
  }

  getVotersCount() async {
    await getIt<APIService>().getVotersCount().then((value) {
      emit(state.copyWith(voutersCount: value));
    });
  }

  getImportantPeople() async {
    await getIt<APIService>().getImportantPeopleDetails().then((value) {
      emit(state.copyWith(importantPeopleList: value));
    });
  }
}
