import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:i2connect/data/injection/singleton.dart';
import 'package:i2connect/data/service/api_client.dart';
import 'package:i2connect/model/dashboard/dashboard/dashboard_model.dart';
import 'package:i2connect/model/dashboard/important_people/important_people_model.dart';
import 'package:i2connect/model/dashboard/voterscount/voterscount_model.dart';
import 'package:i2connect/model/signin/constituency/constituency_model.dart';
import 'package:i2connect/model/signin/districts/districts_model.dart';
import 'package:i2connect/model/signin/signin_response_model.dart';
import 'package:i2connect/model/signin/states_roles/states_roles_model.dart';
import '../../model/voters_data/voters_data_model.dart';
import 'package:i2connect/util/app_constants.dart';



class APIService {
  APIService();

  String _encode(String input) {
    return base64Encode(utf8.encode(input));
  }

  Future<SignInResponseModel?> signin(
      {required String email, required String password}) async {
    const emailKey = "ufj2mjfrpz35rnz8i78f";
    const passwordKey = "c84t7p4pjt4w5clenxiloc1mu";

    final encodedEmail = _encode(email);
    final encodedPassword = _encode(password);
    final encodeEmailKey = _encode(emailKey);
    final encodePasswordKey = _encode(passwordKey);

    final emailEncrypted = '$encodedEmail$encodeEmailKey';
    final passwordEncrypted = '$encodedPassword$encodePasswordKey';

    try {
      return await getIt<APIClient>().postAuth(
          endpoint: AppConstants.signIn,
          data: {
            'email': emailEncrypted,
            'password': passwordEncrypted
          }).then((value) {
        if (value.isLeft && (jsonDecode(value.left.body)['status'] ?? false)) {
          return SignInResponseModel.fromJson(jsonDecode(value.left.body));
        } else {
          if (value.isLeft) {
            Fluttertoast.showToast(msg: jsonDecode(value.left.body)['message']);
          } else {
            Fluttertoast.showToast(msg: value.right.toString());
          }
          return null;
        }
      });
    } catch (e) {
      throw Exception('Network error: $e');
    }
  }

  Future<bool> signup({
    required String email,
    required String firstName,
    required String lastName,
    required String phone,
    required StateModel stateDetails,
    required RoleModel roleDetails,
    required DistrictModel districtDetails,
    required ConstituencyModel constituencyDetails,
  }) async {
    final data = {
      "email_id": email,
      "first_name": firstName,
      "last_name": lastName,
      "password": "User",
      "phone_no": phone,
      "country": stateDetails.country,
      "state": stateDetails.state_id,
      "dist": districtDetails.dist_id,
      "constituency": constituencyDetails.constituency_id,
      "role": roleDetails.role_id
    };
    if (data.containsValue(null) || data.containsValue('')) {
      Fluttertoast.showToast(msg: 'Please select all fields');
      return false;
    }

    try {
      return await getIt<APIClient>()
          .post(endpoint: AppConstants.signup, data: data)
          .then((value) {
        if (value.isLeft && (jsonDecode(value.left.body)['status'] ?? false)) {
          print(jsonDecode(value.left.body));
          return true;
        } else {
          debugPrint(value.left.body);
          if (value.isLeft) {
            Fluttertoast.showToast(msg: jsonDecode(value.left.body)['message']);
          } else {
            Fluttertoast.showToast(msg: value.right.toString());
          }
          return false;
        }
      });
    } catch (e) {
      return false;
    }
  }

  Future<bool> verifyotp({
    required String email,
    required String otp,
  }) async {
    final data = {"email_id": email, "otp": otp};
    if (data.containsValue(null) || data.containsValue('')) {
      Fluttertoast.showToast(msg: 'Please select all fields');
      return false;
    }

    try {
      return await getIt<APIClient>()
          .post(endpoint: AppConstants.verifyotp, data: data)
          .then((value) {
        if (value.isLeft && (jsonDecode(value.left.body)['status'] ?? false)) {
          return true;
        } else {
          debugPrint(value.left.body);
          if (value.isLeft) {
            Fluttertoast.showToast(msg: jsonDecode(value.left.body)['message']);
          } else {
            Fluttertoast.showToast(msg: value.right.toString());
          }
          return false;
        }
      });
    } catch (e) {
      return false;
    }
  }

  Future<DashboardModel?> getDashboardDropdownDetails() async {
    try {
      return await getIt<APIClient>()
          .get(endpoint: AppConstants.dropdowndb)
          .then((value) {
        if (value.isLeft) {
          return DashboardModel.fromJson(jsonDecode(value.left.body));
        } else {
          Fluttertoast.showToast(msg: value.right.toString());
          return null;
        }
      });
    } catch (e) {
      throw Exception('Network error: $e');
    }
  }

  Future<StatesAndRolesModel?> getDropdownRolesAndStates() async {
    try {
      return await getIt<APIClient>()
          .get(endpoint: AppConstants.statesAndRoles)
          .then((value) {
        if (value.isLeft) {
          return StatesAndRolesModel.fromJson(jsonDecode(value.left.body));
        } else {
          Fluttertoast.showToast(msg: value.right.toString());
          return null;
        }
      });
    } catch (e) {
      throw Exception('Network error: $e');
    }
  }

  Future<List<DistrictModel>> getDistricts(
      {required StateModel stateDetails}) async {
    try {
      return await getIt<APIClient>()
          .get(
              endpoint:
                  AppConstants.districts + stateDetails.state_id.toString())
          .then((value) {
        if (value.isLeft) {
          List<DistrictModel> districtList = [];
          for (var data in jsonDecode(value.left.body)) {
            districtList.add(DistrictModel.fromJson(data));
          }
          return districtList;
        } else {
          Fluttertoast.showToast(msg: value.right.toString());
          return [];
        }
      });
    } catch (e) {
      throw Exception('Network error: $e');
    }
  }

  Future<List<ConstituencyModel>> getConstituencies(
      {required RoleModel roleDetails,
      required DistrictModel districtDetails}) async {
    try {
      return await getIt<APIClient>()
          .get(
              endpoint:
                  '${AppConstants.statesAndRoles}?role_id=${roleDetails.role_id}&dist_id=${districtDetails.dist_id}')
          .then((value) {
        if (value.isLeft) {
          List<ConstituencyModel> constituenciesList = [];
          for (var data in jsonDecode(value.left.body)) {
            constituenciesList.add(ConstituencyModel.fromJson(data));
          }
          return constituenciesList;
        } else {
          Fluttertoast.showToast(msg: value.right.toString());
          return [];
        }
      });
    } catch (e) {
      throw Exception('Network error: $e');
    }
  }

  Future<VotersCountModel?> getVotersCount(String? data) async {
    try {
      return await getIt<APIClient>()
          .get(endpoint: AppConstants.votersCount + (data ?? ''))
          .then((value) {
        if (value.isLeft) {
          return VotersCountModel.fromJson(jsonDecode(value.left.body));
        } else {
          Fluttertoast.showToast(msg: value.right.toString());
          return null;
        }
      });
    } catch (e) {
      throw Exception('Network error: $e');
    }
  }

  Future<FavourToModel?> getFavourToDetails(String? data) async {
    try {
      return await getIt<APIClient>()
          .get(endpoint: AppConstants.favour + (data ?? ''))
          .then((value) {
        if (value.isLeft) {
          return FavourToModel.fromJson(jsonDecode(value.left.body));
        } else {
          Fluttertoast.showToast(msg: value.right.toString());
          return null;
        }
      });
    } catch (e) {
      throw Exception('Network error: $e');
    }
  }

  Future<CasteListModel?> getCasteList(String? data) async {
    try {
      return await getIt<APIClient>()
          .get(endpoint: AppConstants.caste + (data ?? ''))
          .then((value) {
        if (value.isLeft) {
          print('---------------caste: ${value.left.body}');
          return CasteListModel.fromJson(jsonDecode(value.left.body));
        } else {
          Fluttertoast.showToast(msg: value.right.toString());
          return null;
        }
      });
    } catch (e) {
      throw Exception('Network error: $e');
    }
  }

  Future<List<ImportantPeopleModel>> getImportantPeopleDetails() async {
    try {
      return await getIt<APIClient>()
          .get(endpoint: AppConstants.importantPeople)
          .then((value) {
        if (value.isLeft) {
          List<ImportantPeopleModel> importantPeopleList = [];
          for (var data in jsonDecode(value.left.body)) {
            importantPeopleList.add(ImportantPeopleModel.fromJson(data));
          }
          return importantPeopleList;
        } else {
          Fluttertoast.showToast(msg: value.right.toString());
          return [];
        }
      });
    } catch (e, s) {
      debugPrint(s.toString());
      throw Exception('Network error: $e');
    }
  }

  Future<bool> addTodo(String todo) async {
    debugPrint('value.left.body');
    try {
      return await getIt<APIClient>().post(
          endpoint: AppConstants.todo,
          data: {'todo_title': todo}).then((value) {
        if (value.isLeft && (jsonDecode(value.left.body)['status'] ?? false)) {
          return true;
        } else {
          if (value.isLeft) {
            Fluttertoast.showToast(msg: jsonDecode(value.left.body)['message']);
          } else {
            Fluttertoast.showToast(msg: value.right.toString());
          }
          return false;
        }
      });
    } catch (e, s) {
      debugPrint(s.toString());
      throw Exception('Network error: $e');
    }
  }

  Future<bool> deleteTodo(int todoId) async {
    debugPrint('value.left.body $todoId');
    try {
      return await getIt<APIClient>().delete(
          endpoint: '${AppConstants.todo}?id=$todoId').then((value) {
        if (value.isLeft && (jsonDecode(value.left.body)['status'] ?? false)) {
          return true;
        } else {
          if (value.isLeft) {
            Fluttertoast.showToast(msg: jsonDecode(value.left.body)['message']);
          } else {
            Fluttertoast.showToast(msg: value.right.toString());
          }
          return false;
        }
      });
    } catch (e, s) {
      debugPrint(s.toString());
      throw Exception('Network error: $e');
    }
  }

  Future<List<TodoModel>> getTodo() async {
    try {
      return await getIt<APIClient>()
          .get(endpoint: AppConstants.todo)
          .then((value) {
        if (value.isLeft) {
          print(jsonDecode(value.left.body));
          List<TodoModel> todoList = [];
          for (var data in jsonDecode(value.left.body)) {
            todoList.add(TodoModel.fromJson(data));
          }
          return todoList;
        } else {
          Fluttertoast.showToast(msg: value.right.toString());
          return [];
        }
      });
    } catch (e, s) {
      debugPrint(s.toString());
      throw Exception('Network error: $e');
    }
  }

  Future<VotersDataResponseModel?> getVotersDetails(int page, String mandalId, String wardVillageId, String pollingBooth) async {
    try {

      var params = '$page';
      if(pollingBooth!=''){
        params = '$params$pollingBooth';
      }
      else if(wardVillageId!=''){
        params = '$params$wardVillageId';
      }
      else if(mandalId!=''){
        params = '$params$mandalId';
      }
      else{
        params = '$page';
      }

      return await getIt<APIClient>()
          .get(endpoint: AppConstants.votersData + (params ?? ''))
          .then((value) {
        if (value.isLeft) {
          return VotersDataResponseModel.fromJson(jsonDecode(value.left.body));
        } else {
          Fluttertoast.showToast(msg: value.right.toString());
          return null;
        }
      });
    } catch (e, s) {
      debugPrint(s.toString());
      throw Exception('Network error: $e');
    }
  }

  Future<VoterDataModel?> searchVoterDetails(String voterId) async {
    try {
      return await getIt<APIClient>()
          .get(endpoint: AppConstants.searchVoterById + voterId)
          .then((value) {
        if (value.isLeft) {
          final data = jsonDecode(value.left.body)['message'];
          if (data != null) {
            return VoterDataModel.fromJson(data[0]);
          } else {
            return null;
          }
        } else {
          Fluttertoast.showToast(msg: value.right.toString());
          return null;
        }
      });
    } catch (e, s) {
      debugPrint(s.toString());
      throw Exception('Network error: $e');
    }
  }

  Future<bool> saveVotersDetails({required VoterDataModel voterData}) async {
    try {
      print(voterData.toJson());
      return await getIt<APIClient>()
          .post(endpoint: AppConstants.addVoter, data:  voterData.toJson())
          .then((value) {
        print(value.left.statusCode);
        print(jsonEncode(value.left.body));
        if (value.isLeft) {
          return true;
        } else {
          Fluttertoast.showToast(msg: value.right.toString());
          return false;
        }
      });
    } catch (e) {
      throw Exception('Network error: $e');
    }
  }

  Future<bool> updateVotersDetails({required VoterDataModel voterData}) async {
    try {
      print(voterData.toJson());
      return await getIt<APIClient>()
          .patch(endpoint: AppConstants.addVoter, data:  voterData.toJson())
          .then((value) {
        print(value.left.statusCode);
        print(jsonEncode(value.left.body));
        if (value.isLeft) {
          return true;
        } else {
          Fluttertoast.showToast(msg: value.right.toString());
          return false;
        }
      });
    } catch (e) {
      throw Exception('Network error: $e');
    }
  }
  Future<bool> deleteVoter({required String voterId}) async {
    try {
      return await getIt<APIClient>()
          .get(endpoint: '${AppConstants.deleteVoter}?voter_id=${voterId}')
          .then((value) {
        print(value.left.statusCode);
        print(jsonEncode(value.left.body));
        if (value.isLeft) {
          return true;
        } else {
          Fluttertoast.showToast(msg: value.right.toString());
          return false;
        }
      });
    } catch (e) {
      throw Exception('Network error: $e');
    }
  }
}


