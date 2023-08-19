// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'districts_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DistrictModel _$DistrictModelFromJson(Map<String, dynamic> json) =>
    DistrictModel(
      dist_id: json['dist_id'] as int?,
      dist_name: json['dist_name'] as String?,
      createdId: json['createdId'] as String?,
      createdDate: json['createdDate'] as String?,
      updatedId: json['updatedId'] as String?,
      updatedDate: json['updatedDate'] as String?,
      state: json['state'] as int?,
    );

Map<String, dynamic> _$DistrictModelToJson(DistrictModel instance) =>
    <String, dynamic>{
      'dist_id': instance.dist_id,
      'dist_name': instance.dist_name,
      'createdId': instance.createdId,
      'createdDate': instance.createdDate,
      'updatedId': instance.updatedId,
      'updatedDate': instance.updatedDate,
      'state': instance.state,
    };
