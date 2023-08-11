import 'package:json_annotation/json_annotation.dart';

part 'states_roles_model.g.dart';

@JsonSerializable()
class StatesAndRolesModel {
  List<StateModel>? states;
  List<RoleModel>? roles;

  StatesAndRolesModel({this.states, this.roles});

  factory StatesAndRolesModel.fromJson(Map<String, dynamic> json) =>
      _$StatesAndRolesModelFromJson(json);

  Map<String, dynamic> toJson() => _$StatesAndRolesModelToJson(this);
}

@JsonSerializable()
class StateModel {
  int? state_id;
  String? state_code;
  String? state_name;
  int? country;

  StateModel({this.state_id, this.state_code, this.state_name, this.country});

  factory StateModel.fromJson(Map<String, dynamic> json) =>
      _$StateModelFromJson(json);

  Map<String, dynamic> toJson() => _$StateModelToJson(this);
}

@JsonSerializable()
class RoleModel {
  int? role_id;
  String? role_name;
  bool? is_active;

  RoleModel({
    this.role_id,
    this.role_name,
    this.is_active,
  });

  factory RoleModel.fromJson(Map<String, dynamic> json) =>
      _$RoleModelFromJson(json);

  Map<String, dynamic> toJson() => _$RoleModelToJson(this);
}
