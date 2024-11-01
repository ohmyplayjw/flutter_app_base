// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vo_liveop_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$LiveopResponseImpl _$$LiveopResponseImplFromJson(Map<String, dynamic> json) =>
    _$LiveopResponseImpl(
      header: LiveopHeader.fromJson(json['header'] as Map<String, dynamic>),
      body: json['body'] as Map<String, dynamic>? ?? const {},
    );

Map<String, dynamic> _$$LiveopResponseImplToJson(
        _$LiveopResponseImpl instance) =>
    <String, dynamic>{
      'header': instance.header,
      'body': instance.body,
    };

_$LiveopHeaderImpl _$$LiveopHeaderImplFromJson(Map<String, dynamic> json) =>
    _$LiveopHeaderImpl(
      returnCode: (json['returnCode'] as num).toInt(),
      returnDesc: json['returnDesc'] as String,
    );

Map<String, dynamic> _$$LiveopHeaderImplToJson(_$LiveopHeaderImpl instance) =>
    <String, dynamic>{
      'returnCode': instance.returnCode,
      'returnDesc': instance.returnDesc,
    };
