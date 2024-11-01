// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vo_score_list.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ScoreListImpl _$$ScoreListImplFromJson(Map<String, dynamic> json) =>
    _$ScoreListImpl(
      scoreInfo: (json['scoreInfo'] as List<dynamic>)
          .map((e) => ScoresheetInfo.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$ScoreListImplToJson(_$ScoreListImpl instance) =>
    <String, dynamic>{
      'scoreInfo': instance.scoreInfo,
    };
