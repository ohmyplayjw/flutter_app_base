// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vo_court_list.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CourtListImpl _$$CourtListImplFromJson(Map<String, dynamic> json) =>
    _$CourtListImpl(
      courts: (json['courts'] as List<dynamic>)
          .map((e) => Court.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$CourtListImplToJson(_$CourtListImpl instance) =>
    <String, dynamic>{
      'courts': instance.courts,
    };
