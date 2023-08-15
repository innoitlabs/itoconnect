import 'package:flutter/gestures.dart';
import 'package:json_annotation/json_annotation.dart';

part 'dashboard_model.g.dart';

@JsonSerializable()
class DashboardModel {
  List<DropdownConstituencyModel>? constituencies;
  List<MandalModel>? mandal;
  List<VillageModal>? villages;
  List<PollingModel>? polling;
  List<PartyModel>? parties;
  List<CasteModel>? caste;

  DashboardModel(
      {this.constituencies,
      this.mandal,
      this.villages,
      this.polling,
      this.parties,
      this.caste});
  factory DashboardModel.fromJson(Map<String, dynamic> json) =>
      _$DashboardModelFromJson(json);

  Map<String, dynamic> toJson() => _$DashboardModelToJson(this);
}

@JsonSerializable()
class DropdownConstituencyModel {
  int? constituency_id;
  int? mp_constituency_no;
  String? mp_constituency_name;
  int? mla_onstituency_no;
  String? mla_constituency_name;
  int? dist_id;

  DropdownConstituencyModel({
    this.constituency_id,
    this.mp_constituency_no,
    this.mp_constituency_name,
    this.mla_onstituency_no,
    this.mla_constituency_name,
    this.dist_id,
  });

  factory DropdownConstituencyModel.fromJson(Map<String, dynamic> json) =>
      _$DropdownConstituencyModelFromJson(json);

  Map<String, dynamic> toJson() => _$DropdownConstituencyModelToJson(this);
}

@JsonSerializable()
class MandalModel {
  int? mandal_id;
  String? mandal_name;
  int? dist_id;
  int? constituency_id;

  MandalModel({
    this.mandal_id,
    this.mandal_name,
    this.dist_id,
    this.constituency_id,
  });

  factory MandalModel.fromJson(Map<String, dynamic> json) =>
      _$MandalModelFromJson(json);

  Map<String, dynamic> toJson() => _$MandalModelToJson(this);
}

@JsonSerializable()
class VillageModal {
  int? ward_village_id;
  String? ward_village_name;
  int? mandal_id;

  VillageModal({
    this.ward_village_id,
    this.ward_village_name,
    this.mandal_id,
  });

  factory VillageModal.fromJson(Map<String, dynamic> json) =>
      _$VillageModalFromJson(json);

  Map<String, dynamic> toJson() => _$VillageModalToJson(this);
}

@JsonSerializable()
class PollingModel {
  int? polling_booth_id;
  int? polling_booth_no;
  String? polling_booth_name;
  String? polling_booth_address;
  int? ward_village_id;
  int? constituency_id;

  PollingModel({
    this.polling_booth_id,
    this.polling_booth_no,
    this.polling_booth_name,
    this.polling_booth_address,
    this.ward_village_id,
    this.constituency_id,
  });
  factory PollingModel.fromJson(Map<String, dynamic> json) =>
      _$PollingModelFromJson(json);

  Map<String, dynamic> toJson() => _$PollingModelToJson(this);
}

@JsonSerializable()
class PartyModel {
  int? party_id;
  String? party_code;
  String? party_name;

  PartyModel({
    this.party_id,
    this.party_code,
    this.party_name,
  });

  factory PartyModel.fromJson(Map<String, dynamic> json) =>
      _$PartyModelFromJson(json);

  Map<String, dynamic> toJson() => _$PartyModelToJson(this);
}

@JsonSerializable()
class CasteModel {
  int? sub_caste_id;
  String? sub_caste_name;
  int? caste_id;

  CasteModel({
    this.sub_caste_id,
    this.sub_caste_name,
    this.caste_id,
  });

  factory CasteModel.fromJson(Map<String, dynamic> json) =>
      _$CasteModelFromJson(json);

  Map<String, dynamic> toJson() => _$CasteModelToJson(this);
}

@JsonSerializable()
class FavourToModel {
  int? ySRCongress;
  int? teluguDesam;
  int? janasena;
  int? bharatiyaJanathaParty;
  int? congress;

  FavourToModel(
      {this.ySRCongress,
      this.teluguDesam,
      this.janasena,
      this.bharatiyaJanathaParty,
      this.congress});

  factory FavourToModel.fromJson(Map<String, dynamic> json) =>
      _$FavourToModelFromJson(json);

  Map<String, dynamic> toJson() => _$FavourToModelToJson(this);
}

@JsonSerializable()
class CasteListModel {
  int? anamuk;
  int? mala;
  int? relli;
  int? madiga;
  int? kuruva;
  int? sugalis;
  int? lambadis;
  int? banjara;
  int? valmiki;
  int? yerukulas;
  int? chanchu;
  int? koya;
  int? mannaDhora;
  int? nayaks;
  int? mudhiraj;
  int? mutrasi;
  int? rajaka;
  int? dommara;
  int? katipapala;
  int? lambada;
  int? medari;
  int? mangali;
  int? nakkala;
  int? veeramushti;
  int? valmikiBoya;
  int? devanga;
  int? goud;
  int? deudekula;
  int? pinjari;
  int? salivahana;
  int? kummara;
  int? kuruma;
  int? nagavaddilu;
  int? perika;
  int? padamasali;
  int? viswabrahmin;
  int? viswakarma;
  int? bondili;
  int? maratha;
  int? bhatraju;
  int? suryaBalija;
  int? kalavanthulu;
  int? dasari;
  int? bukka;
  int? koppilavelama;
  int? yadava;
  int? komati;
  int? kamma;
  int? kapu;
  int? reddy;
  int? vysya;
  int? brahmin;
  int? velama;
  int? muslim;
  int? others;
  int? sathani;
  int? boya;
  int? yanadi;
  int? gowda;
  int? jangam;
  int? tawati;
  int? thogataSali;
  int? saaliBrahmin;
  int? lingayath;
  int? vyshya;
  int? nayiBrahmana;
  int? kshetriya;
  int? areMarati;
  int? rajulu;
  int? singh;
  int? marwadi;
  int? vaddera;
  int? christian;
  int? dakkalavaru;
  int? uppara;
  int? haridasu;
  int? budabukkala;
  int? krishnaBalija;
  int? tamil;

  CasteListModel(
      {this.anamuk,
      this.mala,
      this.relli,
      this.madiga,
      this.kuruva,
      this.sugalis,
      this.lambadis,
      this.banjara,
      this.valmiki,
      this.yerukulas,
      this.chanchu,
      this.koya,
      this.mannaDhora,
      this.nayaks,
      this.mudhiraj,
      this.mutrasi,
      this.rajaka,
      this.dommara,
      this.katipapala,
      this.lambada,
      this.medari,
      this.mangali,
      this.nakkala,
      this.veeramushti,
      this.valmikiBoya,
      this.devanga,
      this.goud,
      this.deudekula,
      this.pinjari,
      this.salivahana,
      this.kummara,
      this.kuruma,
      this.nagavaddilu,
      this.perika,
      this.padamasali,
      this.viswabrahmin,
      this.viswakarma,
      this.bondili,
      this.maratha,
      this.bhatraju,
      this.suryaBalija,
      this.kalavanthulu,
      this.dasari,
      this.bukka,
      this.koppilavelama,
      this.yadava,
      this.komati,
      this.kamma,
      this.kapu,
      this.reddy,
      this.vysya,
      this.brahmin,
      this.velama,
      this.muslim,
      this.others,
      this.sathani,
      this.boya,
      this.yanadi,
      this.gowda,
      this.jangam,
      this.tawati,
      this.thogataSali,
      this.saaliBrahmin,
      this.lingayath,
      this.vyshya,
      this.nayiBrahmana,
      this.kshetriya,
      this.areMarati,
      this.rajulu,
      this.singh,
      this.marwadi,
      this.vaddera,
      this.christian,
      this.dakkalavaru,
      this.uppara,
      this.haridasu,
      this.budabukkala,
      this.krishnaBalija,
      this.tamil});

  factory CasteListModel.fromJson(Map<String, dynamic> json) =>
      _$CasteListModelFromJson(json);

  Map<String, dynamic> toJson() => _$CasteListModelToJson(this);
}
