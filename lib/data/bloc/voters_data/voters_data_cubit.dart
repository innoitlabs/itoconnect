import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:i2connect/data/injection/singleton.dart';
import 'package:i2connect/data/service/api_service.dart';
import 'package:i2connect/model/voters_data/voters_data_model.dart';

part 'voters_data_state.dart';

class VotersDataCubit extends Cubit<VotersDataState> {
  VotersDataCubit() : super(VotersDataState.initial());
  int currentPage = 0;

  void initialize() async {
    currentPage = 1;
    emit(state.copyWith(isLoading: true));
    try {
      await getIt<APIService>().getVotersDetails('$currentPage').then((value) =>
          emit(state.copyWith(isLoading: false, votersData: value?.results)));
      currentPage++;
    } catch (e) {
      emit(state.copyWith(isLoading: false));
    }
  }

  void getMoreVotersData() async {
    debugPrint('fetching $currentPage page voters data');
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
}
