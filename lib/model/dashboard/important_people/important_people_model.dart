import 'package:json_annotation/json_annotation.dart';

part 'important_people_model.g.dart';

@JsonSerializable()
class ImportantPeopleModel {
  dynamic voterId;
  dynamic title;
  dynamic first_name;
  dynamic middleName;
  dynamic lastName;
  dynamic serialNo;
  dynamic gender;
  int? age;
  dynamic dob;
  dynamic phone_no;
  dynamic emailId;
  dynamic relationType;
  dynamic relationFirstName;
  dynamic relationLastName;
  dynamic religionId;
  int? subCasteId;
  dynamic revenueDivision;
  dynamic sectionName;
  dynamic voterTypeId;
  dynamic voterFavourToId;
  dynamic policeStation;
  dynamic education;
  dynamic occupation;
  dynamic companyName;
  dynamic designation;
  int? countryId;
  dynamic stateId;
  int? distId;
  int? constituencyId;
  int? mandalId;
  int? wardVillageId;
  int? pollingBoothId;
  dynamic houseNoName;
  dynamic street;
  int? postalcode;
  dynamic city;
  int? isActive;
  dynamic notes;
  dynamic houseHead;
  dynamic internalPerson;
  dynamic ipVid;
  dynamic ipName;
  dynamic ipPh;
  dynamic refVid;
  dynamic refName;
  dynamic refPh;
  dynamic xx;
  dynamic currLoc;
  dynamic votersCount;
  dynamic createdId;
  dynamic createdDate;
  dynamic updatedId;
  dynamic updatedDate;

  ImportantPeopleModel(
      {this.voterId,
      this.title,
      this.first_name,
      this.middleName,
      this.lastName,
      this.serialNo,
      this.gender,
      this.age,
      this.dob,
      this.phone_no,
      this.emailId,
      this.relationType,
      this.relationFirstName,
      this.relationLastName,
      this.religionId,
      this.subCasteId,
      this.revenueDivision,
      this.sectionName,
      this.voterTypeId,
      this.voterFavourToId,
      this.policeStation,
      this.education,
      this.occupation,
      this.companyName,
      this.designation,
      this.countryId,
      this.stateId,
      this.distId,
      this.constituencyId,
      this.mandalId,
      this.wardVillageId,
      this.pollingBoothId,
      this.houseNoName,
      this.street,
      this.postalcode,
      this.city,
      this.isActive,
      this.notes,
      this.houseHead,
      this.internalPerson,
      this.ipVid,
      this.ipName,
      this.ipPh,
      this.refVid,
      this.refName,
      this.refPh,
      this.xx,
      this.currLoc,
      this.votersCount,
      this.createdId,
      this.createdDate,
      this.updatedId,
      this.updatedDate});

  factory ImportantPeopleModel.fromJson(Map<String, dynamic> json) =>
      _$ImportantPeopleModelFromJson(json);

  Map<String, dynamic> toJson() => _$ImportantPeopleModelToJson(this);
}
