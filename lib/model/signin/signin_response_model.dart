import 'package:json_annotation/json_annotation.dart';

part 'signin_response_model.g.dart';

@JsonSerializable()
class SignInResponseModel {
  bool? status;
  UserDataModel? userData;
  String? token;

  SignInResponseModel({this.status, this.userData, this.token});

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
