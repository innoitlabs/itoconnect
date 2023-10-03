import 'package:json_annotation/json_annotation.dart';

part 'signin_response_model.g.dart';

@JsonSerializable()
class SignInResponseModel {
  bool? status;
  UserDataModel? userData;
  RoleDataModel? roleData;
  String? access;
  String? refresh;

  SignInResponseModel({this.status, this.userData, this.roleData, this.access, this.refresh});

  factory SignInResponseModel.fromJson(Map<String, dynamic> json) =>
      _$SignInResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$SignInResponseModelToJson(this);
}

@JsonSerializable()
class UserDataModel {
  int? userId;
  String? firstName;
  String? lastName;
  String? emailId;
  int? phoneNo;
  String? country;
  String? state;
  String? dist;
  String? role;

  UserDataModel(
      {this.userId,
      this.firstName,
      this.lastName,
      this.emailId,
      this.phoneNo,
      this.country,
      this.state,
      this.dist,
      this.role});
  factory UserDataModel.fromJson(Map<String, dynamic> json) =>
      _$UserDataModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserDataModelToJson(this);
}

@JsonSerializable()
class RoleDataModel {
  String? rolePermissions;

  RoleDataModel({this.rolePermissions});

  RoleDataModel.fromJson(Map<String, dynamic> json) {
    rolePermissions = json['role_permissions'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['role_permissions'] = this.rolePermissions;
    return data;
  }
}
