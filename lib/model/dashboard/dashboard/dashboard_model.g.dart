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
      ySRCongress: json['ySRCongress'] as int?,
      teluguDesam: json['teluguDesam'] as int?,
      janasena: json['janasena'] as int?,
      bharatiyaJanathaParty: json['bharatiyaJanathaParty'] as int?,
      congress: json['congress'] as int?,
    );

Map<String, dynamic> _$FavourToModelToJson(FavourToModel instance) =>
    <String, dynamic>{
      'ySRCongress': instance.ySRCongress,
      'teluguDesam': instance.teluguDesam,
      'janasena': instance.janasena,
      'bharatiyaJanathaParty': instance.bharatiyaJanathaParty,
      'congress': instance.congress,
    };

CasteListModel _$CasteListModelFromJson(Map<String, dynamic> json) =>
    CasteListModel(
      anamuk: json['anamuk'] as int?,
      mala: json['mala'] as int?,
      relli: json['relli'] as int?,
      madiga: json['madiga'] as int?,
      kuruva: json['kuruva'] as int?,
      sugalis: json['sugalis'] as int?,
      lambadis: json['lambadis'] as int?,
      banjara: json['banjara'] as int?,
      valmiki: json['valmiki'] as int?,
      yerukulas: json['yerukulas'] as int?,
      chanchu: json['chanchu'] as int?,
      koya: json['koya'] as int?,
      mannaDhora: json['mannaDhora'] as int?,
      nayaks: json['nayaks'] as int?,
      mudhiraj: json['mudhiraj'] as int?,
      mutrasi: json['mutrasi'] as int?,
      rajaka: json['rajaka'] as int?,
      dommara: json['dommara'] as int?,
      katipapala: json['katipapala'] as int?,
      lambada: json['lambada'] as int?,
      medari: json['medari'] as int?,
      mangali: json['mangali'] as int?,
      nakkala: json['nakkala'] as int?,
      veeramushti: json['veeramushti'] as int?,
      valmikiBoya: json['valmikiBoya'] as int?,
      devanga: json['devanga'] as int?,
      goud: json['goud'] as int?,
      deudekula: json['deudekula'] as int?,
      pinjari: json['pinjari'] as int?,
      salivahana: json['salivahana'] as int?,
      kummara: json['kummara'] as int?,
      kuruma: json['kuruma'] as int?,
      nagavaddilu: json['nagavaddilu'] as int?,
      perika: json['perika'] as int?,
      padamasali: json['padamasali'] as int?,
      viswabrahmin: json['viswabrahmin'] as int?,
      viswakarma: json['viswakarma'] as int?,
      bondili: json['bondili'] as int?,
      maratha: json['maratha'] as int?,
      bhatraju: json['bhatraju'] as int?,
      suryaBalija: json['suryaBalija'] as int?,
      kalavanthulu: json['kalavanthulu'] as int?,
      dasari: json['dasari'] as int?,
      bukka: json['bukka'] as int?,
      koppilavelama: json['koppilavelama'] as int?,
      yadava: json['yadava'] as int?,
      komati: json['komati'] as int?,
      kamma: json['kamma'] as int?,
      kapu: json['kapu'] as int?,
      reddy: json['reddy'] as int?,
      vysya: json['vysya'] as int?,
      brahmin: json['brahmin'] as int?,
      velama: json['velama'] as int?,
      muslim: json['muslim'] as int?,
      others: json['others'] as int?,
      sathani: json['sathani'] as int?,
      boya: json['boya'] as int?,
      yanadi: json['yanadi'] as int?,
      gowda: json['gowda'] as int?,
      jangam: json['jangam'] as int?,
      tawati: json['tawati'] as int?,
      thogataSali: json['thogataSali'] as int?,
      saaliBrahmin: json['saaliBrahmin'] as int?,
      lingayath: json['lingayath'] as int?,
      vyshya: json['vyshya'] as int?,
      nayiBrahmana: json['nayiBrahmana'] as int?,
      kshetriya: json['kshetriya'] as int?,
      areMarati: json['areMarati'] as int?,
      rajulu: json['rajulu'] as int?,
      singh: json['singh'] as int?,
      marwadi: json['marwadi'] as int?,
      vaddera: json['vaddera'] as int?,
      christian: json['christian'] as int?,
      dakkalavaru: json['dakkalavaru'] as int?,
      uppara: json['uppara'] as int?,
      haridasu: json['haridasu'] as int?,
      budabukkala: json['budabukkala'] as int?,
      krishnaBalija: json['krishnaBalija'] as int?,
      tamil: json['tamil'] as int?,
    );

Map<String, dynamic> _$CasteListModelToJson(CasteListModel instance) =>
    <String, dynamic>{
      'anamuk': instance.anamuk,
      'mala': instance.mala,
      'relli': instance.relli,
      'madiga': instance.madiga,
      'kuruva': instance.kuruva,
      'sugalis': instance.sugalis,
      'lambadis': instance.lambadis,
      'banjara': instance.banjara,
      'valmiki': instance.valmiki,
      'yerukulas': instance.yerukulas,
      'chanchu': instance.chanchu,
      'koya': instance.koya,
      'mannaDhora': instance.mannaDhora,
      'nayaks': instance.nayaks,
      'mudhiraj': instance.mudhiraj,
      'mutrasi': instance.mutrasi,
      'rajaka': instance.rajaka,
      'dommara': instance.dommara,
      'katipapala': instance.katipapala,
      'lambada': instance.lambada,
      'medari': instance.medari,
      'mangali': instance.mangali,
      'nakkala': instance.nakkala,
      'veeramushti': instance.veeramushti,
      'valmikiBoya': instance.valmikiBoya,
      'devanga': instance.devanga,
      'goud': instance.goud,
      'deudekula': instance.deudekula,
      'pinjari': instance.pinjari,
      'salivahana': instance.salivahana,
      'kummara': instance.kummara,
      'kuruma': instance.kuruma,
      'nagavaddilu': instance.nagavaddilu,
      'perika': instance.perika,
      'padamasali': instance.padamasali,
      'viswabrahmin': instance.viswabrahmin,
      'viswakarma': instance.viswakarma,
      'bondili': instance.bondili,
      'maratha': instance.maratha,
      'bhatraju': instance.bhatraju,
      'suryaBalija': instance.suryaBalija,
      'kalavanthulu': instance.kalavanthulu,
      'dasari': instance.dasari,
      'bukka': instance.bukka,
      'koppilavelama': instance.koppilavelama,
      'yadava': instance.yadava,
      'komati': instance.komati,
      'kamma': instance.kamma,
      'kapu': instance.kapu,
      'reddy': instance.reddy,
      'vysya': instance.vysya,
      'brahmin': instance.brahmin,
      'velama': instance.velama,
      'muslim': instance.muslim,
      'others': instance.others,
      'sathani': instance.sathani,
      'boya': instance.boya,
      'yanadi': instance.yanadi,
      'gowda': instance.gowda,
      'jangam': instance.jangam,
      'tawati': instance.tawati,
      'thogataSali': instance.thogataSali,
      'saaliBrahmin': instance.saaliBrahmin,
      'lingayath': instance.lingayath,
      'vyshya': instance.vyshya,
      'nayiBrahmana': instance.nayiBrahmana,
      'kshetriya': instance.kshetriya,
      'areMarati': instance.areMarati,
      'rajulu': instance.rajulu,
      'singh': instance.singh,
      'marwadi': instance.marwadi,
      'vaddera': instance.vaddera,
      'christian': instance.christian,
      'dakkalavaru': instance.dakkalavaru,
      'uppara': instance.uppara,
      'haridasu': instance.haridasu,
      'budabukkala': instance.budabukkala,
      'krishnaBalija': instance.krishnaBalija,
      'tamil': instance.tamil,
    };
