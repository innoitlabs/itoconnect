import 'package:json_annotation/json_annotation.dart';

part 'districts_model.g.dart';

@JsonSerializable()
class DistrictModel {
  int? dist_id;
  String? dist_name;
  String? createdId;
  String? createdDate;
  String? updatedId;
  String? updatedDate;
  int? state;

  DistrictModel(
      {this.dist_id,
      this.dist_name,
      this.createdId,
      this.createdDate,
      this.updatedId,
      this.updatedDate,
      this.state});
  factory DistrictModel.fromJson(Map<String, dynamic> json) =>
      _$DistrictModelFromJson(json);

  Map<String, dynamic> toJson() => _$DistrictModelToJson(this);
}
