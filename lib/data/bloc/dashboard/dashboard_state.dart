part of 'dashboard_cubit.dart';

class DashboardState extends Equatable {
  final bool isLoading;
  final VotersCountModel voutersCount;
  final List<ImportantPeopleModel> importantPeopleList;
  const DashboardState(
      {required this.isLoading,
      required this.voutersCount,
      required this.importantPeopleList});

  @override
  List<Object> get props => [isLoading, voutersCount, importantPeopleList];

  DashboardState copyWith(
          {bool? isLoading,
          VotersCountModel? voutersCount,
          List<ImportantPeopleModel>? importantPeopleList}) =>
      DashboardState(
          isLoading: isLoading ?? this.isLoading,
          voutersCount: voutersCount ?? this.voutersCount,
          importantPeopleList: importantPeopleList ?? this.importantPeopleList);

  factory DashboardState.initial() => DashboardState(
      isLoading: false,
      voutersCount: VotersCountModel(),
      importantPeopleList: []);
}
