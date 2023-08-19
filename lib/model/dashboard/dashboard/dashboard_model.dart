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

  CasteListModel.fromJson(Map<String, dynamic> json) {
    anamuk = json['Anamuk'];
    mala = json['Mala'];
    relli = json['Relli'];
    madiga = json['Madiga'];
    kuruva = json['Kuruva'];
    sugalis = json['Sugalis'];
    lambadis = json['Lambadis'];
    banjara = json['Banjara'];
    valmiki = json['Valmiki'];
    yerukulas = json['Yerukulas'];
    chanchu = json['Chanchu'];
    koya = json['Koya'];
    mannaDhora = json['Manna Dhora'];
    nayaks = json['Nayaks'];
    mudhiraj = json['Mudhiraj'];
    mutrasi = json['Mutrasi'];
    rajaka = json['Rajaka'];
    dommara = json['Dommara'];
    katipapala = json['Katipapala'];
    lambada = json['Lambada'];
    medari = json['Medari'];
    mangali = json['Mangali'];
    nakkala = json['Nakkala'];
    veeramushti = json['Veeramushti'];
    valmikiBoya = json['Valmiki Boya'];
    devanga = json['Devanga'];
    goud = json['Goud'];
    deudekula = json['Deudekula'];
    pinjari = json['Pinjari'];
    salivahana = json['Salivahana'];
    kummara = json['Kummara'];
    kuruma = json['Kuruma'];
    nagavaddilu = json['Nagavaddilu'];
    perika = json['Perika'];
    padamasali = json['Padamasali'];
    viswabrahmin = json['Viswabrahmin'];
    viswakarma = json['Viswakarma'];
    bondili = json['Bondili'];
    maratha = json['Maratha'];
    bhatraju = json['Bhatraju'];
    suryaBalija = json['Surya Balija'];
    kalavanthulu = json['Kalavanthulu'];
    dasari = json['Dasari'];
    bukka = json['Bukka'];
    koppilavelama = json['Koppilavelama'];
    yadava = json['Yadava'];
    komati = json['Komati'];
    kamma = json['Kamma'];
    kapu = json['Kapu'];
    reddy = json['Reddy'];
    vysya = json['Vysya'];
    brahmin = json['Brahmin'];
    velama = json['Velama'];
    muslim = json['Muslim'];
    others = json['Others'];
    sathani = json['Sathani'];
    boya = json['Boya'];
    yanadi = json['Yanadi'];
    gowda = json['Gowda'];
    jangam = json['Jangam'];
    tawati = json['Tawati'];
    thogataSali = json['Thogata Sali'];
    saaliBrahmin = json['Saali Brahmin'];
    lingayath = json['Lingayath'];
    vyshya = json['Vyshya'];
    nayiBrahmana = json['Nayi Brahmana'];
    kshetriya = json['Kshetriya'];
    areMarati = json['Are Marati'];
    rajulu = json['Rajulu'];
    singh = json['Singh'];
    marwadi = json['Marwadi'];
    vaddera = json['Vaddera'];
    christian = json['Christian'];
    dakkalavaru = json['Dakkalavaru'];
    uppara = json['Uppara'];
    haridasu = json['Haridasu'];
    budabukkala = json['Budabukkala'];
    krishnaBalija = json['Krishna Balija'];
    tamil = json['Tamil'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Anamuk'] = anamuk;
    data['Mala'] = mala;
    data['Relli'] = relli;
    data['Madiga'] = madiga;
    data['Kuruva'] = kuruva;
    data['Sugalis'] = sugalis;
    data['Lambadis'] = lambadis;
    data['Banjara'] = banjara;
    data['Valmiki'] = valmiki;
    data['Yerukulas'] = yerukulas;
    data['Chanchu'] = chanchu;
    data['Koya'] = koya;
    data['Manna Dhora'] = mannaDhora;
    data['Nayaks'] = nayaks;
    data['Mudhiraj'] = mudhiraj;
    data['Mutrasi'] = mutrasi;
    data['Rajaka'] = rajaka;
    data['Dommara'] = dommara;
    data['Katipapala'] = katipapala;
    data['Lambada'] = lambada;
    data['Medari'] = medari;
    data['Mangali'] = mangali;
    data['Nakkala'] = nakkala;
    data['Veeramushti'] = veeramushti;
    data['Valmiki Boya'] = valmikiBoya;
    data['Devanga'] = devanga;
    data['Goud'] = goud;
    data['Deudekula'] = deudekula;
    data['Pinjari'] = pinjari;
    data['Salivahana'] = salivahana;
    data['Kummara'] = kummara;
    data['Kuruma'] = kuruma;
    data['Nagavaddilu'] = nagavaddilu;
    data['Perika'] = perika;
    data['Padamasali'] = padamasali;
    data['Viswabrahmin'] = viswabrahmin;
    data['Viswakarma'] = viswakarma;
    data['Bondili'] = bondili;
    data['Maratha'] = maratha;
    data['Bhatraju'] = bhatraju;
    data['Surya Balija'] = suryaBalija;
    data['Kalavanthulu'] = kalavanthulu;
    data['Dasari'] = dasari;
    data['Bukka'] = bukka;
    data['Koppilavelama'] = koppilavelama;
    data['Yadava'] = yadava;
    data['Komati'] = komati;
    data['Kamma'] = kamma;
    data['Kapu'] = kapu;
    data['Reddy'] = reddy;
    data['Vysya'] = vysya;
    data['Brahmin'] = brahmin;
    data['Velama'] = velama;
    data['Muslim'] = muslim;
    data['Others'] = others;
    data['Sathani'] = sathani;
    data['Boya'] = boya;
    data['Yanadi'] = yanadi;
    data['Gowda'] = gowda;
    data['Jangam'] = jangam;
    data['Tawati'] = tawati;
    data['Thogata Sali'] = thogataSali;
    data['Saali Brahmin'] = saaliBrahmin;
    data['Lingayath'] = lingayath;
    data['Vyshya'] = vyshya;
    data['Nayi Brahmana'] = nayiBrahmana;
    data['Kshetriya'] = kshetriya;
    data['Are Marati'] = areMarati;
    data['Rajulu'] = rajulu;
    data['Singh'] = singh;
    data['Marwadi'] = marwadi;
    data['Vaddera'] = vaddera;
    data['Christian'] = christian;
    data['Dakkalavaru'] = dakkalavaru;
    data['Uppara'] = uppara;
    data['Haridasu'] = haridasu;
    data['Budabukkala'] = budabukkala;
    data['Krishna Balija'] = krishnaBalija;
    data['Tamil'] = tamil;
    return data;
  }
}

class TodoModel {
  int? todoId;
  String? todoTitle;
  int? userId;

  TodoModel({this.todoId, this.todoTitle, this.userId});

  TodoModel.fromJson(Map<String, dynamic> json) {
    todoId = json['todo_id'];
    todoTitle = json['todo_title'];
    userId = json['user_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['todo_id'] = todoId;
    data['todo_title'] = todoTitle;
    data['user_id'] = userId;
    return data;
  }
}
