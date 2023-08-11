// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'states_roles_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StatesAndRolesModel _$StatesAndRolesModelFromJson(Map<String, dynamic> json) =>
    StatesAndRolesModel(
      states: (json['states'] as List<dynamic>?)
          ?.map((e) => StateModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      roles: (json['roles'] as List<dynamic>?)
          ?.map((e) => RoleModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$StatesAndRolesModelToJson(
        StatesAndRolesModel instance) =>
    <String, dynamic>{
      'states': instance.states,
      'roles': instance.roles,
    };

StateModel _$StateModelFromJson(Map<String, dynamic> json) => StateModel(
      state_id: json['state_id'] as int?,
      state_code: json['state_code'] as String?,
      state_name: json['state_name'] as String?,
      country: json['country'] as int?,
    );

Map<String, dynamic> _$StateModelToJson(StateModel instance) =>
    <String, dynamic>{
      'state_id': instance.state_id,
      'state_code': instance.state_code,
      'state_name': instance.state_name,
      'country': instance.country,
    };

RoleModel _$RoleModelFromJson(Map<String, dynamic> json) => RoleModel(
      role_id: json['role_id'] as int?,
      role_name: json['role_name'] as String?,
      is_active: json['is_active'] as bool?,
    );

Map<String, dynamic> _$RoleModelToJson(RoleModel instance) => <String, dynamic>{
      'role_id': instance.role_id,
      'role_name': instance.role_name,
      'is_active': instance.is_active,
    };
