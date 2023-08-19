part of 'auth_cubit.dart';

class AuthState extends Equatable {
  final bool isLoading;
  final StatesAndRolesModel statesAndRoles;
  final RoleModel selectedRole;
  final StateModel selectedState;
  final List<DistrictModel> districtsList;
  final List<ConstituencyModel> constituenciesList;
  final DistrictModel selectedDistrict;
  final ConstituencyModel selectedConstituency;

  const AuthState({
    required this.isLoading,
    required this.statesAndRoles,
    required this.selectedRole,
    required this.selectedState,
    required this.districtsList,
    required this.selectedDistrict,
    required this.constituenciesList,
    required this.selectedConstituency,
  });

  @override
  List<Object> get props => [
        isLoading,
        statesAndRoles,
        selectedRole,
        selectedState,
        districtsList,
        selectedDistrict,
        constituenciesList,
        selectedConstituency,
      ];

  AuthState copyWith({
    bool? isLoading,
    StatesAndRolesModel? statesAndRoles,
    RoleModel? selectedRole,
    StateModel? selectedState,
    List<DistrictModel>? districtsList,
    DistrictModel? selectedDistrict,
    List<ConstituencyModel>? constituenciesList,
    ConstituencyModel? selectedConstituency,
  }) =>
      AuthState(
        isLoading: isLoading ?? this.isLoading,
        statesAndRoles: statesAndRoles ?? this.statesAndRoles,
        selectedRole: selectedRole ?? this.selectedRole,
        selectedState: selectedState ?? this.selectedState,
        districtsList: districtsList ?? this.districtsList,
        selectedDistrict: selectedDistrict ?? this.selectedDistrict,
        constituenciesList: constituenciesList ?? this.constituenciesList,
        selectedConstituency: selectedConstituency ?? this.selectedConstituency,
      );

  factory AuthState.initial() => AuthState(
        isLoading: false,
        statesAndRoles: StatesAndRolesModel(roles: [], states: []),
        selectedRole: RoleModel(),
        selectedState: StateModel(),
        districtsList: const <DistrictModel>[],
        selectedDistrict: DistrictModel(),
        constituenciesList: const [],
        selectedConstituency: ConstituencyModel(),
      );
}
