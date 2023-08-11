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
      token: json['token'] as String?,
    );

Map<String, dynamic> _$SignInResponseModelToJson(
        SignInResponseModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'userData': instance.userData,
      'token': instance.token,
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
