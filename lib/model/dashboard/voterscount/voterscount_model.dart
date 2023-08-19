import 'package:json_annotation/json_annotation.dart';

part 'voterscount_model.g.dart';

@JsonSerializable()
class VotersCountModel {
  int? total_voters;
  int? male_voters;
  int? female_voters;
  int? other_voters;

  VotersCountModel(
      {this.total_voters,
      this.male_voters,
      this.female_voters,
      this.other_voters});
  factory VotersCountModel.fromJson(Map<String, dynamic> json) =>
      _$VotersCountModelFromJson(json);

  Map<String, dynamic> toJson() => _$VotersCountModelToJson(this);
}
