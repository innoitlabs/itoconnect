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
  String? designation;
  int? subCaste;

  VoterDataModel({
    this.voterId,
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
    this.designation,
    this.subCaste,
  });

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
    designation = json['designation'];
    subCaste = json['sub_caste'];
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
    data['designation'] = designation;
    data['sub_caste'] = subCaste;
    return data;
  }
}
