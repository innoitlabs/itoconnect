import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:http/http.dart';
import 'package:i2connect/data/injection/singleton.dart';
import 'package:i2connect/data/service/api_service.dart';
import 'package:i2connect/model/dashboard/dashboard/dashboard_model.dart';
import 'package:i2connect/model/dashboard/important_people/important_people_model.dart';
import 'package:i2connect/model/dashboard/voterscount/voterscount_model.dart';
import 'package:i2connect/model/signin/constituency/constituency_model.dart';

part 'dashboard_state.dart';

class DashboardCubit extends Cubit<DashboardState> {
  DashboardCubit() : super(DashboardState.initial());

  void initialize() {
    getDashboardDropdownDetails();
    getVotersCount(null);
    getImportantPeople();
    getTodo();
  }

  void reinitialize() {
    String data = '';
    final selectedConstituenciesIds =
        state.selectedConstituencies.map((e) => e.constituency_id).toList();
    final selectedMandalIds =
        state.selectedMandal.map((e) => e.mandal_id).toList();
    final selectedVillagesIds =
        state.selectedVillages.map((e) => e.ward_village_id).toList();
    final selectedPollingIds =
        state.selectedPollings.map((e) => e.polling_booth_id).toList();
    data = selectedConstituenciesIds.isNotEmpty
        ? '$data?constituency_id=${selectedConstituenciesIds.toString().replaceFirst('[', '').replaceFirst(']', '').replaceAll(' ', '')}'
        : '';
    data = selectedMandalIds.isNotEmpty
        ? '$data&mandal=${selectedMandalIds.toString().replaceFirst('[', '').replaceFirst(']', '').replaceAll(' ', '')}'
        : data;
    data = selectedVillagesIds.isNotEmpty
        ? '$data&ward_village=${selectedVillagesIds.toString().replaceFirst('[', '').replaceFirst(']', '').replaceAll(' ', '')}'
        : data;
    data = selectedPollingIds.isNotEmpty
        ? '$data&polling_booth=${selectedPollingIds.toString().replaceFirst('[', '').replaceFirst(']', '').replaceAll(' ', '')}'
        : data;
    getVotersCount(data);
    getFavourToDetails(data);
    getCasteList(data);
  }

  void getDashboardDropdownDetails() async {
    await getIt<APIService>().getDashboardDropdownDetails().then((value) {
      emit(
        state.copyWith(
          dropdownDetails: value,
          selectedConstituencies: value?.constituencies,
        ),
      );
    });
    reinitialize();
  }

  void updateSelectedConstituency(
      DropdownConstituencyModel constituency, bool add) {
    if (add) {
      List<DropdownConstituencyModel> data = [];
      data.addAll(state.selectedConstituencies);
      data.add(constituency);
      emit(state.copyWith(
        selectedConstituencies: data,
        selectedMandal: [],
        selectedVillages: [],
        selectedPollings: [],
      ));
    } else {
      List<DropdownConstituencyModel> data = [];
      data.addAll(state.selectedConstituencies);
      data.remove(constituency);
      emit(state.copyWith(
        selectedConstituencies: data,
        selectedMandal: [],
        selectedVillages: [],
        selectedPollings: [],
      ));
    }
    reinitialize();
  }

  void updateSelectedMandals(MandalModel mandal, bool add) {
    if (add) {
      List<MandalModel> data = [];
      data.addAll(state.selectedMandal);
      data.add(mandal);
      emit(state.copyWith(
        selectedMandal: data,
        selectedVillages: [],
        selectedPollings: [],
      ));
    } else {
      List<MandalModel> data = [];
      data.addAll(state.selectedMandal);
      data.remove(mandal);
      emit(state.copyWith(
        selectedMandal: data,
        selectedVillages: [],
        selectedPollings: [],
      ));
    }
    reinitialize();
  }

  void updateSelectedVillages(VillageModal village, bool add) {
    if (add) {
      List<VillageModal> data = [];
      data.addAll(state.selectedVillages);
      data.add(village);
      emit(state.copyWith(
        selectedVillages: data,
        selectedPollings: [],
      ));
    } else {
      List<VillageModal> data = [];
      data.addAll(state.selectedVillages);
      data.remove(village);
      emit(state.copyWith(
        selectedVillages: data,
        selectedPollings: [],
      ));
    }
    reinitialize();
  }

  void updateSelectedPolling(PollingModel polling, bool add) {
    if (add) {
      List<PollingModel> data = [];
      data.addAll(state.selectedPollings);
      data.add(polling);
      emit(state.copyWith(selectedPollings: data));
    } else {
      List<PollingModel> data = [];
      data.addAll(state.selectedPollings);
      data.remove(polling);
      emit(state.copyWith(selectedPollings: data));
    }
    reinitialize();
  }

  void addTodo(String todo) async {
    await getIt<APIService>().addTodo(todo).then((value) {
      if (value) {
        getTodo();
      }
    });
  }

  void getVotersCount(String? data) async {
    await getIt<APIService>().getVotersCount(data).then((value) {
      emit(state.copyWith(voutersCount: value));
    });
  }

  void getFavourToDetails(String? data) async {
    await getIt<APIService>().getFavourToDetails(data).then((value) {
      emit(state.copyWith(favourToList: value));
    });
  }

  void getCasteList(String? data) async {
    await getIt<APIService>().getCasteList(data).then((value) {
      emit(state.copyWith(casteList: value));
    });
  }

  void getImportantPeople() async {
    await getIt<APIService>().getImportantPeopleDetails().then((value) {
      emit(state.copyWith(importantPeopleList: value));
    });
  }

  void getTodo() async {
    await getIt<APIService>().getTodo().then((value) {
      print('------------lsd $value');
      emit(state.copyWith(todoList: value));
    });
  }
}
