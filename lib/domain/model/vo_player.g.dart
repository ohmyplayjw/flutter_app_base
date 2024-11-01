// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vo_player.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PlayerImpl _$$PlayerImplFromJson(Map<String, dynamic> json) => _$PlayerImpl(
      participantId: json['participantId'] as String,
      userId: (json['userId'] as num).toInt(),
      attr1: json['attr1'] as String,
      name: json['name'] as String,
    );

Map<String, dynamic> _$$PlayerImplToJson(_$PlayerImpl instance) =>
    <String, dynamic>{
      'participantId': instance.participantId,
      'userId': instance.userId,
      'attr1': instance.attr1,
      'name': instance.name,
    };
