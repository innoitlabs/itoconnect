part of 'voters_data_cubit.dart';

class VotersDataState extends Equatable {
  final bool isLoading;
  final VoterDataModel searchVoterData;
  final List<VoterDataModel> votersData;
  final DashboardModel dropdownDetails;
  final List<DropdownConstituencyModel> selectedConstituencies;
  final List<MandalModel> selectedMandal;
  final List<VillageModal> selectedVillages;
  final List<PollingModel> selectedPollings;

  const VotersDataState({
    required this.isLoading,
    required this.votersData,
    required this.searchVoterData,
    required this.dropdownDetails,
    required this.selectedConstituencies,
    required this.selectedMandal,
    required this.selectedVillages,
    required this.selectedPollings,
  });

  @override
  List<Object> get props => [
        isLoading,
        votersData,
        searchVoterData,
        dropdownDetails,
        selectedConstituencies,
        selectedMandal,
        selectedVillages,
        selectedPollings
      ];

  VotersDataState copyWith({
    bool? isLoading,
    List<VoterDataModel>? votersData,
    VoterDataModel? searchVoterData,
    DashboardModel? dropdownDetails,
    List<DropdownConstituencyModel>? selectedConstituencies,
    List<MandalModel>? selectedMandal,
    List<VillageModal>? selectedVillages,
    List<PollingModel>? selectedPollings,
  }) =>
      VotersDataState(
        isLoading: isLoading ?? this.isLoading,
        votersData: votersData ?? this.votersData,
        searchVoterData: searchVoterData ?? this.searchVoterData,
        dropdownDetails: dropdownDetails ?? this.dropdownDetails,
        selectedConstituencies:
            selectedConstituencies ?? this.selectedConstituencies,
        selectedMandal: selectedMandal ?? this.selectedMandal,
        selectedVillages: selectedVillages ?? this.selectedVillages,
        selectedPollings: selectedPollings ?? this.selectedPollings,
      );

  factory VotersDataState.initial() => VotersDataState(
        isLoading: false,
        votersData: const [],
        searchVoterData: VoterDataModel(),
        dropdownDetails: DashboardModel(),
        selectedConstituencies: const [],
        selectedMandal: const [],
        selectedPollings: const [],
        selectedVillages: const [],
      );
}
