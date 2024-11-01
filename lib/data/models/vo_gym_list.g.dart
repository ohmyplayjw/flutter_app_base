// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vo_gym_list.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GymListImpl _$$GymListImplFromJson(Map<String, dynamic> json) =>
    _$GymListImpl(
      gyms: (json['gyms'] as List<dynamic>)
          .map((e) => Gym.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$GymListImplToJson(_$GymListImpl instance) =>
    <String, dynamic>{
      'gyms': instance.gyms,
    };
