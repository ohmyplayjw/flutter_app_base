// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vo_reservation_list.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ReservationListImpl _$$ReservationListImplFromJson(
        Map<String, dynamic> json) =>
    _$ReservationListImpl(
      reservations: (json['reservations'] as List<dynamic>)
          .map((e) => Reservation.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$ReservationListImplToJson(
        _$ReservationListImpl instance) =>
    <String, dynamic>{
      'reservations': instance.reservations,
    };
