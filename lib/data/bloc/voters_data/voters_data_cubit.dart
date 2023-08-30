import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:i2connect/data/injection/singleton.dart';
import 'package:i2connect/data/service/api_service.dart';
import 'package:i2connect/model/dashboard/dashboard/dashboard_model.dart';
import 'package:i2connect/model/voters_data/voters_data_model.dart';

part 'voters_data_state.dart';

class VotersDataCubit extends Cubit<VotersDataState> {
  VotersDataCubit() : super(VotersDataState.initial());
  int currentPage = 0;

  void initialize() async {
    currentPage = 1;
    emit(state.copyWith(isLoading: true));
    getDashboardDropdownDetails();
    try {
      await getIt<APIService>().getVotersDetails('$currentPage').then((value) =>
          emit(state.copyWith(isLoading: false, votersData: value?.results)));
      currentPage++;
    } catch (e) {
      emit(state.copyWith(isLoading: false));
    }
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
  }

  void getMoreVotersData() async {
    try {
      await getIt<APIService>().getVotersDetails('$currentPage').then((value) {
        List<VoterDataModel> votersData = [];
        votersData.addAll(state.votersData);
        votersData.addAll(value?.results ?? []);
        emit(state.copyWith(isLoading: false, votersData: votersData));
        currentPage++;
      });
    } catch (e) {
      debugPrint('unable to fetch $currentPage page voters data');
    }
  }

  Future<bool> saveVoterData(VoterDataModel voterData) async {
    return getIt<APIService>().saveVotersDetails(voterData: voterData);
  }

  searchVoter(String voterId) async {
    try {
      await getIt<APIService>().searchVoterDetails(voterId).then((value) {
        emit(state.copyWith(searchVoterData: value));
      });
    } catch (e) {
      debugPrint('unable to fetch $currentPage page voters data');
    }
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
  }
}
