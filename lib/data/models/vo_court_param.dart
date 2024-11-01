import 'package:freezed_annotation/freezed_annotation.dart';

part 'vo_court_param.freezed.dart';
part 'vo_court_param.g.dart';

@freezed
class CourtParam with _$CourtParam {
  factory CourtParam({
    required String loginKey,
    required String macAddress,
    required String gymId,
    required String courtId,
  }) = _CourtParam;
  factory CourtParam.fromJson(Map<String, dynamic> json) => _$CourtParamFromJson(json);
  }