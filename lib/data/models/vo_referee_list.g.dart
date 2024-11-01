// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vo_referee_list.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RefereeListImpl _$$RefereeListImplFromJson(Map<String, dynamic> json) =>
    _$RefereeListImpl(
      referees: (json['referees'] as List<dynamic>)
          .map((e) => Referee.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$RefereeListImplToJson(_$RefereeListImpl instance) =>
    <String, dynamic>{
      'referees': instance.referees,
    };
