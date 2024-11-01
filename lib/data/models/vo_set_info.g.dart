// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vo_set_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SetInfoImpl _$$SetInfoImplFromJson(Map<String, dynamic> json) =>
    _$SetInfoImpl(
      gymId: json['gymId'] as String,
      setNum: (json['setNum'] as num).toInt(),
      reservationNum: (json['reservationNum'] as num).toInt(),
      rightParticipantId: json['rightParticipantId'] as String,
      leftParticipantId: json['leftParticipantId'] as String,
      serverUserId: json['serverUserId'] as String,
      receiveUserId: json['receiveUserId'] as String,
      registDate: (json['registDate'] as num).toInt(),
      scoreInfo: (json['scoreInfo'] as List<dynamic>)
          .map((e) => ScoresheetInfo.fromJson(e as Map<String, dynamic>))
          .toList(),
      searchType: json['searchType'] as String?,
      name: json['name'] as String?,
      gameType: json['gameType'] as String?,
      viewType: json['viewType'] as String?,
      externalTnmtId: json['externalTnmtId'] as String?,
      externalKey: json['externalKey'] as String?,
    );

Map<String, dynamic> _$$SetInfoImplToJson(_$SetInfoImpl instance) =>
    <String, dynamic>{
      'gymId': instance.gymId,
      'setNum': instance.setNum,
      'reservationNum': instance.reservationNum,
      'rightParticipantId': instance.rightParticipantId,
      'leftParticipantId': instance.leftParticipantId,
      'serverUserId': instance.serverUserId,
      'receiveUserId': instance.receiveUserId,
      'registDate': instance.registDate,
      'scoreInfo': instance.scoreInfo,
      'searchType': instance.searchType,
      'name': instance.name,
      'gameType': instance.gameType,
      'viewType': instance.viewType,
      'externalTnmtId': instance.externalTnmtId,
      'externalKey': instance.externalKey,
    };
