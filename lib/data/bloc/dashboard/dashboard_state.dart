part of 'dashboard_cubit.dart';

class DashboardState extends Equatable {
  final bool isLoading;

  final DashboardModel dropdownDetails;
  final List<DropdownConstituencyModel> selectedConstituencies;
  final List<MandalModel> selectedMandal;
  final List<VillageModal> selectedVillages;
  final List<PollingModel> selectedPollings;
  final VotersCountModel voutersCount;
  final CasteListModel casteList;
  final FavourToModel favourToList;
  final List<ImportantPeopleModel> importantPeopleList;
  final List<TodoModel> todoList;
  const DashboardState({
    required this.isLoading,
    required this.dropdownDetails,
    required this.selectedConstituencies,
    required this.selectedMandal,
    required this.selectedVillages,
    required this.selectedPollings,
    required this.voutersCount,
    required this.casteList,
    required this.favourToList,
    required this.importantPeopleList,
    required this.todoList,
  });

  @override
  List<Object> get props => [
        isLoading,
        dropdownDetails,
        selectedConstituencies,
        selectedMandal,
        selectedVillages,
        selectedPollings,
        voutersCount,
        casteList,
        favourToList,
        importantPeopleList,
        todoList,
      ];

  DashboardState copyWith({
    bool? isLoading,
    VotersCountModel? voutersCount,
    CasteListModel? casteList,
    FavourToModel? favourToList,
    DashboardModel? dropdownDetails,
    List<DropdownConstituencyModel>? selectedConstituencies,
    List<MandalModel>? selectedMandal,
    List<VillageModal>? selectedVillages,
    List<PollingModel>? selectedPollings,
    List<ImportantPeopleModel>? importantPeopleList,
    List<TodoModel>? todoList,
  }) =>
      DashboardState(
        isLoading: isLoading ?? this.isLoading,
        dropdownDetails: dropdownDetails ?? this.dropdownDetails,
        selectedConstituencies:
            selectedConstituencies ?? this.selectedConstituencies,
        selectedMandal: selectedMandal ?? this.selectedMandal,
        selectedVillages: selectedVillages ?? this.selectedVillages,
        selectedPollings: selectedPollings ?? this.selectedPollings,
        voutersCount: voutersCount ?? this.voutersCount,
        casteList: casteList ?? this.casteList,
        favourToList: favourToList ?? this.favourToList,
        importantPeopleList: importantPeopleList ?? this.importantPeopleList,
        todoList: todoList ?? this.todoList,
      );

  factory DashboardState.initial() => DashboardState(
        isLoading: false,
        dropdownDetails: DashboardModel(),
        selectedConstituencies: const [],
        selectedMandal: const [],
        selectedVillages: const [],
        selectedPollings: const [],
        voutersCount: VotersCountModel(),
        casteList: CasteListModel(),
        favourToList: FavourToModel(),
        importantPeopleList: const [],
        todoList: const [],
      );
}
