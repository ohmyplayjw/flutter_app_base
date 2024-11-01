import 'package:freezed_annotation/freezed_annotation.dart';

part 'vo_court.freezed.dart';
part 'vo_court.g.dart';

@freezed
class Court with _$Court {
  const factory Court({
    required String gymId,
    required String courtId,
    required String courtNum,
    required String useage,
    required String reservation,
    required int startUse,
    int? gameWaitTimeDate,
    required int reservationNum,
    required int colIndex,
    required int rowIndex,
    required int direction,
    String? streamId,
    required int rentalReservationGroupNum,
    String? gameType,
    required int practiceTime,
    String? clubId,
    String? checkRecordVideo,
    required int cnt,
    int? gameNum,
    String? gameName,
    List<int>? userList,
    int? courtSeq,
    String? regionKeypath,
  }) = _Court;

  factory Court.fromJson(Map<String, dynamic> json) => _$CourtFromJson(json);
}

int _intFromString(dynamic json) {
  if (json is String) {
    return int.parse(json);
  } else if (json is int) {
    return json;
  } else {
    throw Exception("Unexpected type for integer conversion");
  }
}
