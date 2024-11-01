import 'package:freezed_annotation/freezed_annotation.dart';

part 'vo_monitoring_call_param.freezed.dart';
part 'vo_monitoring_call_param.g.dart';

@freezed
class MonitoringCallParam with _$MonitoringCallParam {
  const factory MonitoringCallParam(
      {required String gymId,
      required String macAddress,
      required String loginKey,
      required String courtId,
      required int reservationNum,
      required int managerType}) = _MonitoringCallParam;

  factory MonitoringCallParam.fromJson(Map<String, dynamic> json) =>
      _$MonitoringCallParamFromJson(json);
}
