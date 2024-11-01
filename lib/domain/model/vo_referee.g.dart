// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vo_referee.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RefereeImpl _$$RefereeImplFromJson(Map<String, dynamic> json) =>
    _$RefereeImpl(
      gymId: json['gymId'] as String,
      refereeId: (json['refereeId'] as num?)?.toInt(),
      refereeName: json['refereeName'] as String,
    );

Map<String, dynamic> _$$RefereeImplToJson(_$RefereeImpl instance) =>
    <String, dynamic>{
      'gymId': instance.gymId,
      'refereeId': instance.refereeId,
      'refereeName': instance.refereeName,
    };
