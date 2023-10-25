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
  var selectedConstuencyIds = [];
  var selectedMandalIds = [];
  var selectedWardVillageIds = [];
  var selectedPollingBoothIds = [];

  void initialize() async {
    currentPage = 1;

    emit(state.copyWith(isLoading: true));
    getDashboardDropdownDetails();
    final selectedMandalIds =
    state.selectedMandal.map((e) => e.mandal_id).toList();
    final selectedVillagesIds =
    state.selectedVillages.map((e) => e.ward_village_id).toList();
    final selectedPollingIds =
    state.selectedPollings.map((e) => e.polling_booth_id).toList();
    final selectedMandalIdsStr = selectedMandalIds.isNotEmpty
        ? '&mandal_id=${selectedMandalIds.toString().replaceFirst('[', '').replaceFirst(']', '').replaceAll(' ', '')}'
        : '';
    final selectedVillagesIdsStr = selectedVillagesIds.isNotEmpty
        ? '&ward_village_id=${selectedVillagesIds.toString().replaceFirst('[', '').replaceFirst(']', '').replaceAll(' ', '')}'
        : '';
    final selectedPollingIdsStr = selectedPollingIds.isNotEmpty
        ? '&polling_booth=${selectedPollingIds.toString().replaceFirst('[', '').replaceFirst(']', '').replaceAll(' ', '')}'
        : '';
    try {
      await getIt<APIService>().getVotersDetails(currentPage,selectedMandalIdsStr,selectedVillagesIdsStr,selectedPollingIdsStr).then((value) =>
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
    // final selectedConstituenciesIds =
    // state.selectedConstituencies.map((e) => e.constituency_id).toList();
    final selectedMandalIds =
    state.selectedMandal.map((e) => e.mandal_id).toList();
    final selectedVillagesIds =
    state.selectedVillages.map((e) => e.ward_village_id).toList();
    final selectedPollingIds =
    state.selectedPollings.map((e) => e.polling_booth_id).toList();
    final selectedMandalIdsStr = selectedMandalIds.isNotEmpty
        ? '&mandal_id=${selectedMandalIds.toString().replaceFirst('[', '').replaceFirst(']', '').replaceAll(' ', '')}'
        : '';
    final selectedVillagesIdsStr = selectedVillagesIds.isNotEmpty
        ? '&ward_village_id=${selectedVillagesIds.toString().replaceFirst('[', '').replaceFirst(']', '').replaceAll(' ', '')}'
        : '';
    final selectedPollingIdsStr = selectedPollingIds.isNotEmpty
        ? '&polling_booth=${selectedPollingIds.toString().replaceFirst('[', '').replaceFirst(']', '').replaceAll(' ', '')}'
        : '';
    try {
      await getIt<APIService>().getVotersDetails(currentPage, selectedMandalIdsStr, selectedVillagesIdsStr, selectedPollingIdsStr).then((value) {
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

  Future<bool> updateVoterData(VoterDataModel voterData) async {
    return getIt<APIService>().updateVotersDetails(voterData: voterData);
  }

  Future<bool> deleteVoter(String voterId) async {
    return getIt<APIService>().deleteVoter(voterId: voterId);
  }

  searchVoter(String voterId) async {
    try {
      await getIt<APIService>().searchVoterDetails(voterId).then((value) {
        emit(state.copyWith(searchVoterData: value));
      });
    } catch (e) {
      //debugPrint(e.toString());
      debugPrint('unable to fetch $currentPage page voters data');
    }
  }

  clearSearchVoter(String voterId) async {
    print(voterId);
    try {
      if(voterId == ""){
        emit(state.copyWith(searchVoterData: null));
      }
      print(state.searchVoterData.voterId);
    } catch (e) {
      //debugPrint(e.toString());
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
    print(mandal.mandal_name);
    print(add);
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
      data.removeWhere((item) => item.mandal_id == mandal.mandal_id);
      //data.remove(mandal);
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
      data.removeWhere((item) => item.ward_village_id == village.ward_village_id);
      //data.remove(village);
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
      data.removeWhere((item) => item.polling_booth_id == polling.polling_booth_id);
      //data.remove(polling);
      emit(state.copyWith(selectedPollings: data));
    }
  }
}
