// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vo_participant.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ParticipantImpl _$$ParticipantImplFromJson(Map<String, dynamic> json) =>
    _$ParticipantImpl(
      participantId: json['participantId'] as String,
      playerList: (json['playerList'] as List<dynamic>)
          .map((e) => Player.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$ParticipantImplToJson(_$ParticipantImpl instance) =>
    <String, dynamic>{
      'participantId': instance.participantId,
      'playerList': instance.playerList,
    };
