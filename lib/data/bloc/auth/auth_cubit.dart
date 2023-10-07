import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:i2connect/data/injection/singleton.dart';
import 'package:i2connect/data/service/api_service.dart';
import 'package:i2connect/model/signin/constituency/constituency_model.dart';
import 'package:i2connect/model/signin/districts/districts_model.dart';
import 'package:i2connect/model/signin/states_roles/states_roles_model.dart';
import 'package:share/share.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthState.initial());

  void getDropdownRolesAndStates() async {
    await getIt<APIService>().getDropdownRolesAndStates().then((value) {
      final statesAndRoles = StatesAndRolesModel(states: [], roles: []);
      if (value != null) {
        List<RoleModel> roles = [];
        roles.addAll(value.roles ?? []);
        roles.removeWhere((element) =>
            element.role_name == null || element.role_name!.isEmpty);
        statesAndRoles.roles = roles;
        statesAndRoles.states = value.states;
      }
      emit(state.copyWith(statesAndRoles: statesAndRoles));
    });
  }

  void getDistricts() async {
    await getIt<APIService>()
        .getDistricts(stateDetails: state.selectedState)
        .then((value) {
      emit(state.copyWith(districtsList: value));
    });
  }

  void getConstituencies() async {
    await getIt<APIService>()
        .getConstituencies(
            roleDetails: state.selectedRole,
            districtDetails: state.selectedDistrict)
        .then((value) {
      emit(state.copyWith(constituenciesList: value));
    });
  }

  void updateRole(RoleModel selected) {
    emit(
      state.copyWith(
        selectedRole: selected,
        selectedState: StateModel(),
        selectedDistrict: DistrictModel(),
        selectedConstituency: ConstituencyModel(),
        districtsList: [],
        constituenciesList: [],
      ),
    );
  }

  void updateState(StateModel selected) {
    emit(
      state.copyWith(
        selectedState: selected,
        selectedDistrict: DistrictModel(),
        selectedConstituency: ConstituencyModel(),
        districtsList: [],
        constituenciesList: [],
      ),
    );
    getDistricts();
  }

  void updateDistrict(DistrictModel selected) {
    emit(
      state.copyWith(
        selectedDistrict: selected,
        selectedConstituency: ConstituencyModel(),
        constituenciesList: [],
      ),
    );
    getConstituencies();
  }

  void updateConstituency(ConstituencyModel selected) {
    emit(
      state.copyWith(
        selectedConstituency: selected,
      ),
    );
  }

  Future<bool> onClickSignIn(
      {required String email, required String password}) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    emit(state.copyWith(isLoading: true));
    return await getIt<APIService>()
        .signin(email: email, password: password)
        .then((value) {
      emit(state.copyWith(isLoading: false));
      if (value != null) {
        preferences.setString('token', value.access ?? "");
        preferences.setString('refresh', value.refresh ?? "");
        return true;
      } else {
        return false;
      }
    });
  }

  Future<bool> onClickSignUp(
      {required String email,
      required String firstName,
      required String lastName,
      required String phone}) async {
    emit(state.copyWith(isLoading: true));
    return await getIt<APIService>()
        .signup(
            email: email,
            firstName: firstName,
            lastName: lastName,
            phone: phone,
            stateDetails: state.selectedState,
            districtDetails: state.selectedDistrict,
            constituencyDetails: state.selectedConstituency,
            roleDetails: state.selectedRole)
        .then((value) {
      emit(state.copyWith(isLoading: false));
      if (value) {
        return true;
      } else {
        return false;
      }
    });
  }

  Future<bool> onClickVerifyOTP(
      {required String email, required String otp}) async {
    emit(state.copyWith(isLoading: true));
    return await getIt<APIService>()
        .verifyotp(email: email, otp: otp)
        .then((value) {
      emit(state.copyWith(isLoading: false));
      if (value) {
        return true;
      } else {
        return false;
      }
    });
  }
}
