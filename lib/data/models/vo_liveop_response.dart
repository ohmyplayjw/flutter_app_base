import 'package:freezed_annotation/freezed_annotation.dart';

part 'vo_liveop_response.freezed.dart';
part 'vo_liveop_response.g.dart';

@freezed
class LiveopResponse with _$LiveopResponse {
  const factory LiveopResponse({
    required LiveopHeader header,
   @Default({}) Map<String, dynamic> body,
  }) = _LiveopResponse;

  factory LiveopResponse.fromJson(Map<String, dynamic> json) => _$LiveopResponseFromJson(json);
}

@freezed
class LiveopHeader with _$LiveopHeader {
  const factory LiveopHeader({
    required int returnCode,
    required String returnDesc,
  }) = _LiveopHeader;

  factory LiveopHeader.fromJson(Map<String, dynamic> json) => _$LiveopHeaderFromJson(json);
}