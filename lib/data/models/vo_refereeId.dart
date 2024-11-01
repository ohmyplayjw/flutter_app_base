import 'package:freezed_annotation/freezed_annotation.dart';

part 'vo_refereeId.freezed.dart';
part 'vo_refereeId.g.dart';

@freezed
class RefereeId with _$RefereeId {
  factory RefereeId({
    required int refereeId,
  }) = _RefereeId;

  factory RefereeId.fromJson(Map<String, dynamic> json) =>
      _$RefereeIdFromJson(json);
}
