// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'voterscount_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VotersCountModel _$VotersCountModelFromJson(Map<String, dynamic> json) =>
    VotersCountModel(
      total_voters: json['total_voters'] as int?,
      male_voters: json['male_voters'] as int?,
      female_voters: json['female_voters'] as int?,
      other_voters: json['other_voters'] as int?,
    );

Map<String, dynamic> _$VotersCountModelToJson(VotersCountModel instance) =>
    <String, dynamic>{
      'total_voters': instance.total_voters,
      'male_voters': instance.male_voters,
      'female_voters': instance.female_voters,
      'other_voters': instance.other_voters,
    };
