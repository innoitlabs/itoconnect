// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dashboard_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DashboardModel _$DashboardModelFromJson(Map<String, dynamic> json) =>
    DashboardModel(
      constituencies: (json['constituencies'] as List<dynamic>?)
          ?.map((e) =>
              DropdownConstituencyModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      mandal: (json['mandal'] as List<dynamic>?)
          ?.map((e) => MandalModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      villages: (json['villages'] as List<dynamic>?)
          ?.map((e) => VillageModal.fromJson(e as Map<String, dynamic>))
          .toList(),
      polling: (json['polling'] as List<dynamic>?)
          ?.map((e) => PollingModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      parties: (json['parties'] as List<dynamic>?)
          ?.map((e) => PartyModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      caste: (json['caste'] as List<dynamic>?)
          ?.map((e) => CasteModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$DashboardModelToJson(DashboardModel instance) =>
    <String, dynamic>{
      'constituencies': instance.constituencies,
      'mandal': instance.mandal,
      'villages': instance.villages,
      'polling': instance.polling,
      'parties': instance.parties,
      'caste': instance.caste,
    };

DropdownConstituencyModel _$DropdownConstituencyModelFromJson(
        Map<String, dynamic> json) =>
    DropdownConstituencyModel(
      constituency_id: json['constituency_id'] as int?,
      mp_constituency_no: json['mp_constituency_no'] as int?,
      mp_constituency_name: json['mp_constituency_name'] as String?,
      mla_onstituency_no: json['mla_onstituency_no'] as int?,
      mla_constituency_name: json['mla_constituency_name'] as String?,
      dist_id: json['dist_id'] as int?,
    );

Map<String, dynamic> _$DropdownConstituencyModelToJson(
        DropdownConstituencyModel instance) =>
    <String, dynamic>{
      'constituency_id': instance.constituency_id,
      'mp_constituency_no': instance.mp_constituency_no,
      'mp_constituency_name': instance.mp_constituency_name,
      'mla_onstituency_no': instance.mla_onstituency_no,
      'mla_constituency_name': instance.mla_constituency_name,
      'dist_id': instance.dist_id,
    };

MandalModel _$MandalModelFromJson(Map<String, dynamic> json) => MandalModel(
      mandal_id: json['mandal_id'] as int?,
      mandal_name: json['mandal_name'] as String?,
      dist_id: json['dist_id'] as int?,
      constituency_id: json['constituency_id'] as int?,
    );

Map<String, dynamic> _$MandalModelToJson(MandalModel instance) =>
    <String, dynamic>{
      'mandal_id': instance.mandal_id,
      'mandal_name': instance.mandal_name,
      'dist_id': instance.dist_id,
      'constituency_id': instance.constituency_id,
    };

VillageModal _$VillageModalFromJson(Map<String, dynamic> json) => VillageModal(
      ward_village_id: json['ward_village_id'] as int?,
      ward_village_name: json['ward_village_name'] as String?,
      mandal_id: json['mandal_id'] as int?,
    );

Map<String, dynamic> _$VillageModalToJson(VillageModal instance) =>
    <String, dynamic>{
      'ward_village_id': instance.ward_village_id,
      'ward_village_name': instance.ward_village_name,
      'mandal_id': instance.mandal_id,
    };

PollingModel _$PollingModelFromJson(Map<String, dynamic> json) => PollingModel(
      polling_booth_id: json['polling_booth_id'] as int?,
      polling_booth_no: json['polling_booth_no'] as int?,
      polling_booth_name: json['polling_booth_name'] as String?,
      polling_booth_address: json['polling_booth_address'] as String?,
      ward_village_id: json['ward_village_id'] as int?,
      constituency_id: json['constituency_id'] as int?,
    );

Map<String, dynamic> _$PollingModelToJson(PollingModel instance) =>
    <String, dynamic>{
      'polling_booth_id': instance.polling_booth_id,
      'polling_booth_no': instance.polling_booth_no,
      'polling_booth_name': instance.polling_booth_name,
      'polling_booth_address': instance.polling_booth_address,
      'ward_village_id': instance.ward_village_id,
      'constituency_id': instance.constituency_id,
    };

PartyModel _$PartyModelFromJson(Map<String, dynamic> json) => PartyModel(
      party_id: json['party_id'] as int?,
      party_code: json['party_code'] as String?,
      party_name: json['party_name'] as String?,
    );

Map<String, dynamic> _$PartyModelToJson(PartyModel instance) =>
    <String, dynamic>{
      'party_id': instance.party_id,
      'party_code': instance.party_code,
      'party_name': instance.party_name,
    };

CasteModel _$CasteModelFromJson(Map<String, dynamic> json) => CasteModel(
      sub_caste_id: json['sub_caste_id'] as int?,
      sub_caste_name: json['sub_caste_name'] as String?,
      caste_id: json['caste_id'] as int?,
    );

Map<String, dynamic> _$CasteModelToJson(CasteModel instance) =>
    <String, dynamic>{
      'sub_caste_id': instance.sub_caste_id,
      'sub_caste_name': instance.sub_caste_name,
      'caste_id': instance.caste_id,
    };

FavourToModel _$FavourToModelFromJson(Map<String, dynamic> json) =>
    FavourToModel(
      tDP: json['tDP'] as int?,
      bJP: json['bJP'] as int?,
      iNC: json['iNC'] as int?,
      tRS: json['tRS'] as int?,
      cPM: json['cPM'] as int?,
      iNDP: json['iNDP'] as int?,
      nOTA: json['nOTA'] as int?,
      bRS: json['bRS'] as int?,
      mIM: json['mIM'] as int?,
    );

Map<String, dynamic> _$FavourToModelToJson(FavourToModel instance) =>
    <String, dynamic>{
      'tDP': instance.tDP,
      'bJP': instance.bJP,
      'iNC': instance.iNC,
      'tRS': instance.tRS,
      'cPM': instance.cPM,
      'iNDP': instance.iNDP,
      'nOTA': instance.nOTA,
      'bRS': instance.bRS,
      'mIM': instance.mIM,
    };
