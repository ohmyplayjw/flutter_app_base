import 'package:freezed_annotation/freezed_annotation.dart';

part 'vo_shuttle_count.freezed.dart';
part 'vo_shuttle_count.g.dart';

@freezed
class ShuttleCountParam with _$ShuttleCountParam {
  const factory ShuttleCountParam({
    required String gymId,
    required String macAddress,
    required String loginKey,
    required String courtId,
    required int reservationNum,
  }) = _ShuttleCountRequest;

  factory ShuttleCountParam.fromJson(Map<String, dynamic> json) =>
      _$ShuttleCountParamFromJson(json);
}
