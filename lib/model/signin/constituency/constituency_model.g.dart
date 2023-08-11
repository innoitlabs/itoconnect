// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'constituency_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ConstituencyModel _$ConstituencyModelFromJson(Map<String, dynamic> json) =>
    ConstituencyModel(
      constituency_id: json['constituency_id'] as int?,
      mp_constituency_no: json['mp_constituency_no'] as int?,
      mp_constituency_name: json['mp_constituency_name'] as String?,
      mla_constituency_no: json['mla_constituency_no'] as int?,
      mla_constituency_name: json['mla_constituency_name'] as String?,
      dist: json['dist'] as int?,
    );

Map<String, dynamic> _$ConstituencyModelToJson(ConstituencyModel instance) =>
    <String, dynamic>{
      'constituency_id': instance.constituency_id,
      'mp_constituency_no': instance.mp_constituency_no,
      'mp_constituency_name': instance.mp_constituency_name,
      'mla_constituency_no': instance.mla_constituency_no,
      'mla_constituency_name': instance.mla_constituency_name,
      'dist': instance.dist,
    };
