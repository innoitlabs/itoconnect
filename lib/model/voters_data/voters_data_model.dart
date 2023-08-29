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
  String? religionReligionName;
  String? subCasteSubCasteName;
  String? subCaste;
  String? subCasteCasteCasteName;
  String? constituencyMlaConstituencyName;
  String? revenueDivision;
  String? sectionName;
  String? voterTypeVoterTypeName;
  String? voterFavourToPartyName;
  String? pollingBoothPollingBoothName;
  int? pollingBoothPollingBoothId;
  String? pollingBoothPollingBoothAddress;
  String? policeStation;
  String? companyName;
  String? designation;
  String? countryCountryName;
  String? stateStateName;
  String? distDistName;
  String? mandalMandalName;
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
  String? constituency;
  String? pollingBoothName;
  int? pollingBoothId;
  String? pollingBoothAddress;
  String? state;
  String? country;
  int? pollingBoothNo;

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
      this.religionReligionName,
      this.subCasteSubCasteName,
      this.subCaste,
      this.subCasteCasteCasteName,
      this.constituencyMlaConstituencyName,
      this.revenueDivision,
      this.sectionName,
      this.voterTypeVoterTypeName,
      this.voterFavourToPartyName,
      this.pollingBoothPollingBoothName,
      this.pollingBoothPollingBoothId,
      this.pollingBoothPollingBoothAddress,
      this.policeStation,
      this.companyName,
      this.designation,
      this.countryCountryName,
      this.stateStateName,
      this.distDistName,
      this.mandalMandalName,
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
      this.occupation,
      this.constituency,
      this.pollingBoothName,
      this.pollingBoothId,
      this.pollingBoothAddress,
      this.state,
      this.country,
      this.pollingBoothNo});

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
    religionReligionName = json['religion__religion_name'];
    subCasteSubCasteName = json['sub_caste__sub_caste_name'];
    // subCaste = json['sub_caste'];
    subCasteCasteCasteName = json['sub_caste_caste_caste_name'];
    constituencyMlaConstituencyName =
        json['constituency__mla_constituency_name'];
    revenueDivision = json['revenue_division'];
    sectionName = json['section_name'];
    voterTypeVoterTypeName = json['voter_type__voter_type_name'];
    voterFavourToPartyName = json['voter_favour_to__party_name'];
    pollingBoothPollingBoothName = json['polling_booth__polling_booth_name'];
    pollingBoothPollingBoothId = json['polling_booth__polling_booth_id'];
    pollingBoothPollingBoothAddress =
        json['polling_booth__polling_booth_address'];
    policeStation = json['police_station'];
    companyName = json['company_name'];
    designation = json['designation'];
    countryCountryName = json['country__country_name'];
    stateStateName = json['state__state_name'];
    distDistName = json['dist__dist_name'];
    mandalMandalName = json['mandal__mandal_name'];
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
    constituency = json['constituency'];
    pollingBoothName = json['polling_booth_name'];
    pollingBoothId = json['polling_booth_id '];
    pollingBoothAddress = json['polling_booth_address'];
    state = json['state'];
    country = json['country'];
    pollingBoothNo = json['polling_booth_no'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['voter_id'] = voterId;
    data['title'] = title;
    data['first_name'] = firstName;
    data['middle_name'] = middleName;
    data['last_name'] = lastName;
    data['serial_no'] = serialNo;
    data['gender'] = gender;
    data['age'] = age;
    data['dob'] = dob;
    data['phone_no'] = phoneNo;
    data['email_id'] = emailId;
    data['relation_type'] = relationType;
    data['relation_first_name'] = relationFirstName;
    data['relation_last_name'] = relationLastName;
    data['religion__religion_name'] = religionReligionName;
    data['sub_caste__sub_caste_name'] = subCasteSubCasteName;
    data['sub_caste'] = subCaste;
    data['sub_caste_caste_caste_name'] = subCasteCasteCasteName;
    data['constituency__mla_constituency_name'] =
        constituencyMlaConstituencyName;
    data['revenue_division'] = revenueDivision;
    data['section_name'] = sectionName;
    data['voter_type__voter_type_name'] = voterTypeVoterTypeName;
    data['voter_favour_to__party_name'] = voterFavourToPartyName;
    data['polling_booth__polling_booth_name'] = pollingBoothPollingBoothName;
    data['polling_booth__polling_booth_id'] = pollingBoothPollingBoothId;
    data['polling_booth__polling_booth_address'] =
        pollingBoothPollingBoothAddress;
    data['police_station'] = policeStation;
    data['company_name'] = companyName;
    data['designation'] = designation;
    data['country__country_name'] = countryCountryName;
    data['state__state_name'] = stateStateName;
    data['dist__dist_name'] = distDistName;
    data['mandal__mandal_name'] = mandalMandalName;
    data['ward_village__ward_village_name'] = wardVillageWardVillageName;
    data['house_no_name'] = houseNoName;
    data['street'] = street;
    data['postalcode'] = postalcode;
    data['city'] = city;
    data['notes'] = notes;
    data['house_head'] = houseHead;
    data['internal_person'] = internalPerson;
    data['ip_vid'] = ipVid;
    data['ip_name'] = ipName;
    data['ip_ph'] = ipPh;
    data['ref_vid'] = refVid;
    data['ref_name'] = refName;
    data['ref_ph'] = refPh;
    data['xx'] = xx;
    data['curr_loc'] = currLoc;
    data['voters_count'] = votersCount;
    data['education'] = education;
    data['occupation'] = occupation;
    data['constituency'] = constituency;
    data['polling_booth_name'] = pollingBoothName;
    data['polling_booth_id '] = pollingBoothId;
    data['polling_booth_address'] = pollingBoothAddress;
    data['state'] = state;
    data['country'] = country;
    data['polling_booth_no'] = pollingBoothNo;
    return data;
  }
}
