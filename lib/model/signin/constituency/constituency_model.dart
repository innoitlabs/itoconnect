import 'package:json_annotation/json_annotation.dart';

part 'constituency_model.g.dart';

@JsonSerializable()
class ConstituencyModel {
  int? constituency_id;
  int? mp_constituency_no;
  String? mp_constituency_name;
  int? mla_constituency_no;
  String? mla_constituency_name;
  int? dist;

  ConstituencyModel(
      {this.constituency_id,
      this.mp_constituency_no,
      this.mp_constituency_name,
      this.mla_constituency_no,
      this.mla_constituency_name,
      this.dist});

  factory ConstituencyModel.fromJson(Map<String, dynamic> json) =>
      _$ConstituencyModelFromJson(json);

  Map<String, dynamic> toJson() => _$ConstituencyModelToJson(this);
}
