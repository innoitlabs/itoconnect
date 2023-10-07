import 'package:json_annotation/json_annotation.dart';

class VotersDataResponseModel {
  int? count;
  String? next;
  String? previous;
  List<VoterDataModel>? results;

  VotersDataResponseModel({this.count, this.next, this.previous, this.results});

  VotersDataResponseModel.fromJson(Map<String, dynamic> json) {
    count = json['count'];
    next = json['next'];
    previous = json['previous'];
    if (json['results'] != null) {
      results = <VoterDataModel>[];
      json['results'].forEach((v) {
        results!.add(VoterDataModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['count'] = count;
    data['next'] = next;
    data['previous'] = previous;
    if (results != null) {
      data['results'] = results!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class VoterDataModel {
  String? voterId;
  String? title;
  String? firstName;
  String? middleName;
  String? lastName;
  int? serialNo;
  String? gender;
  int? age;
  String? dob;
  int? phoneNo;
  String? emailId;
  String? relationType;
  String? relationFirstName;
  String? relationLastName;
  int? religion;
  String? religionReligionName;
  int? subCaste;
  String? subCasteSubCasteName;
  int? subCasteCasteCasteId;
  String? subCasteCasteCasteName;
  int? constituency;
  String? constituencyMlaConstituencyName;
  String? constituencyMpConstituencyName;
  String? revenueDivision;
  String? sectionName;
  int? voterType;
  String? voterTypeVoterTypeName;
  int? voterFavourTo;
  String? voterFavourToPartyName;
  int? pollingBooth;
  String? pollingBoothPollingBoothName;
  String? pollingBoothPollingBoothAddress;
  int? pollingBoothPollingBoothNo;
  String? policeStation;
  String? companyName;
  String? designation;
  int? country;
  String? countryCountryName;
  int? state;
  String? stateStateName;
  int? dist;
  String? distDistName;
  int? mandal;
  String? mandalMandalName;
  int? wardVillage;
  String? wardVillageWardVillageName;
  String? houseNoName;
  String? street;
  int? postalcode;
  String? city;
  String? notes;
  String? houseHead;
  String? internalPerson;
  int? ipVid;
  String? ipName;
  int? ipPh;
  int? refVid;
  String? refName;
  int? refPh;
  String? xx;
  String? currLoc;
  int? votersCount;
  String? education;
  String? occupation;

  VoterDataModel(
      {this.voterId,
        this.title,
        this.firstName,
        this.middleName,
        this.lastName,
        this.serialNo,
        this.gender,
        this.age,
        this.dob,
        this.phoneNo,
        this.emailId,
        this.relationType,
        this.relationFirstName,
        this.relationLastName,
        this.religion,
        this.religionReligionName,
        this.subCaste,
        this.subCasteSubCasteName,
        this.subCasteCasteCasteId,
        this.subCasteCasteCasteName,
        this.constituency,
        this.constituencyMlaConstituencyName,
        this.constituencyMpConstituencyName,
        this.revenueDivision,
        this.sectionName,
        this.voterType,
        this.voterTypeVoterTypeName,
        this.voterFavourTo,
        this.voterFavourToPartyName,
        this.pollingBooth,
        this.pollingBoothPollingBoothName,
        this.pollingBoothPollingBoothAddress,
        this.pollingBoothPollingBoothNo,
        this.policeStation,
        this.companyName,
        this.designation,
        this.country,
        this.countryCountryName,
        this.state,
        this.stateStateName,
        this.dist,
        this.distDistName,
        this.mandal,
        this.mandalMandalName,
        this.wardVillage,
        this.wardVillageWardVillageName,
        this.houseNoName,
        this.street,
        this.postalcode,
        this.city,
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
        this.education,
        this.occupation});

  VoterDataModel.fromJson(Map<String, dynamic> json) {
    voterId = json['voter_id'];
    title = json['title'];
    firstName = json['first_name'];
    middleName = json['middle_name'];
    lastName = json['last_name'];
    serialNo = json['serial_no'];
    gender = json['gender'];
    age = json['age'];
    dob = json['dob'];
    phoneNo = json['phone_no'];
    emailId = json['email_id'];
    relationType = json['relation_type'];
    relationFirstName = json['relation_first_name'];
    relationLastName = json['relation_last_name'];
    religion = json['religion'];
    religionReligionName = json['religion__religion_name'];
    subCaste = json['sub_caste'];
    subCasteSubCasteName = json['sub_caste__sub_caste_name'];
    subCasteCasteCasteId = json['sub_caste__caste__caste_id'];
    subCasteCasteCasteName = json['sub_caste__caste__caste_name'];
    constituency = json['constituency'];
    constituencyMlaConstituencyName =
    json['constituency__mla_constituency_name'];
    constituencyMpConstituencyName = json['constituency__mp_constituency_name'];
    revenueDivision = json['revenue_division'];
    sectionName = json['section_name'];
    voterType = json['voter_type'];
    voterTypeVoterTypeName = json['voter_type__voter_type_name'];
    voterFavourTo = json['voter_favour_to'];
    voterFavourToPartyName = json['voter_favour_to__party_name'];
    pollingBooth = json['polling_booth'];
    pollingBoothPollingBoothName = json['polling_booth__polling_booth_name'];
    pollingBoothPollingBoothAddress =
    json['polling_booth__polling_booth_address'];
    pollingBoothPollingBoothNo = json['polling_booth__polling_booth_no'];
    policeStation = json['police_station'];
    companyName = json['company_name'];
    designation = json['designation'];
    country = json['country'];
    countryCountryName = json['country__country_name'];
    state = json['state'];
    stateStateName = json['state__state_name'];
    dist = json['dist'];
    distDistName = json['dist__dist_name'];
    mandal = json['mandal'];
    mandalMandalName = json['mandal__mandal_name'];
    wardVillage = json['ward_village'];
    wardVillageWardVillageName = json['ward_village__ward_village_name'];
    houseNoName = json['house_no_name'];
    street = json['street'];
    postalcode = json['postalcode'];
    city = json['city'];
    notes = json['notes'];
    houseHead = json['house_head'];
    internalPerson = json['internal_person'];
    ipVid = json['ip_vid'];
    ipName = json['ip_name'];
    ipPh = json['ip_ph'];
    refVid = json['ref_vid'];
    refName = json['ref_name'];
    refPh = json['ref_ph'];
    xx = json['xx'];
    currLoc = json['curr_loc'];
    votersCount = json['voters_count'];
    education = json['education'];
    occupation = json['occupation'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['voter_id'] = this.voterId;
    data['title'] = this.title;
    data['first_name'] = this.firstName;
    data['middle_name'] = this.middleName;
    data['last_name'] = this.lastName;
    data['serial_no'] = this.serialNo;
    data['gender'] = this.gender;
    data['age'] = this.age;
    data['dob'] = this.dob;
    data['phone_no'] = this.phoneNo;
    data['email_id'] = this.emailId;
    data['relation_type'] = this.relationType;
    data['relation_first_name'] = this.relationFirstName;
    data['relation_last_name'] = this.relationLastName;
    data['religion'] = this.religion;
    data['religion__religion_name'] = this.religionReligionName;
    data['sub_caste'] = this.subCaste;
    data['sub_caste__sub_caste_name'] = this.subCasteSubCasteName;
    data['sub_caste__caste__caste_id'] = this.subCasteCasteCasteId;
    data['sub_caste__caste__caste_name'] = this.subCasteCasteCasteName;
    data['constituency'] = this.constituency;
    data['constituency__mla_constituency_name'] =
        this.constituencyMlaConstituencyName;
    data['constituency__mp_constituency_name'] =
        this.constituencyMpConstituencyName;
    data['revenue_division'] = this.revenueDivision;
    data['section_name'] = this.sectionName;
    data['voter_type'] = this.voterType;
    data['voter_type__voter_type_name'] = this.voterTypeVoterTypeName;
    data['voter_favour_to'] = this.voterFavourTo;
    data['voter_favour_to__party_name'] = this.voterFavourToPartyName;
    data['polling_booth'] = this.pollingBooth;
    data['polling_booth__polling_booth_name'] =
        this.pollingBoothPollingBoothName;
    data['polling_booth__polling_booth_address'] =
        this.pollingBoothPollingBoothAddress;
    data['polling_booth__polling_booth_no'] = this.pollingBoothPollingBoothNo;
    data['police_station'] = this.policeStation;
    data['company_name'] = this.companyName;
    data['designation'] = this.designation;
    data['country'] = this.country;
    data['country__country_name'] = this.countryCountryName;
    data['state'] = this.state;
    data['state__state_name'] = this.stateStateName;
    data['dist'] = this.dist;
    data['dist__dist_name'] = this.distDistName;
    data['mandal'] = this.mandal;
    data['mandal__mandal_name'] = this.mandalMandalName;
    data['ward_village'] = this.wardVillage;
    data['ward_village__ward_village_name'] = this.wardVillageWardVillageName;
    data['house_no_name'] = this.houseNoName;
    data['street'] = this.street;
    data['postalcode'] = this.postalcode;
    data['city'] = this.city;
    data['notes'] = this.notes;
    data['house_head'] = this.houseHead;
    data['internal_person'] = this.internalPerson;
    data['ip_vid'] = this.ipVid;
    data['ip_name'] = this.ipName;
    data['ip_ph'] = this.ipPh;
    data['ref_vid'] = this.refVid;
    data['ref_name'] = this.refName;
    data['ref_ph'] = this.refPh;
    data['xx'] = this.xx;
    data['curr_loc'] = this.currLoc;
    data['voters_count'] = this.votersCount;
    data['education'] = this.education;
    data['occupation'] = this.occupation;
    return data;
  }
}
