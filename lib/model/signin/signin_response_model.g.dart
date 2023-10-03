// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'signin_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SignInResponseModel _$SignInResponseModelFromJson(Map<String, dynamic> json) =>
    SignInResponseModel(
      status: json['status'] as bool?,
      userData: json['userData'] == null
          ? null
          : UserDataModel.fromJson(json['userData'] as Map<String, dynamic>),
      roleData: json['roleData'] == null
          ? null
          : RoleDataModel.fromJson(json['roleData'] as Map<String, dynamic>),
      access: json['access'] as String?,
      refresh: json['refresh'] as String?,
    );

Map<String, dynamic> _$SignInResponseModelToJson(
        SignInResponseModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'userData': instance.userData,
      'roleData': instance.roleData,
      'access': instance.access,
      'refresh': instance.refresh,
    };

UserDataModel _$UserDataModelFromJson(Map<String, dynamic> json) =>
    UserDataModel(
      userId: json['userId'] as int?,
      firstName: json['firstName'] as String?,
      lastName: json['lastName'] as String?,
      emailId: json['emailId'] as String?,
      phoneNo: json['phoneNo'] as int?,
      country: json['country'] as String?,
      state: json['state'] as String?,
      dist: json['dist'] as String?,
      role: json['role'] as String?,
    );

Map<String, dynamic> _$UserDataModelToJson(UserDataModel instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'emailId': instance.emailId,
      'phoneNo': instance.phoneNo,
      'country': instance.country,
      'state': instance.state,
      'dist': instance.dist,
      'role': instance.role,
    };

RoleDataModel _$RoleDataModelFromJson(Map<String, dynamic> json) =>
    RoleDataModel(
      rolePermissions: json['rolePermissions'] as String?,
    );

Map<String, dynamic> _$RoleDataModelToJson(RoleDataModel instance) =>
    <String, dynamic>{
      'rolePermissions': instance.rolePermissions,
    };
