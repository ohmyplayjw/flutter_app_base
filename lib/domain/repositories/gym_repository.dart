import '../../data/models/vo_court_list.dart';
import '../../data/models/vo_court_param.dart';
import '../../data/models/vo_default_param.dart';
import '../../data/models/vo_liveop_response.dart';
import '../../data/models/vo_refereeId.dart';
import '../../data/models/vo_referee_enroll_param.dart';
import '../../data/models/vo_referee_list.dart';
import '../../data/models/vo_referee_param.dart';
import '../../data/models/vo_reservation_list.dart';
import '../../data/network/result/api_error.dart';
import '../../data/simple_result.dart';

abstract class GymRepository<T> {
  Future<SimpleResult<CourtList, ApiError>> getCourts(
      DefaultParam defaultParam);
  Future<SimpleResult<ReservationList, ApiError>> getReservations(
      CourtParam courtParam);
  Future<SimpleResult<RefereeList, ApiError>> getReferees(
      DefaultParam defaultParam);
  Future<SimpleResult<RefereeId, ApiError>> addReferee(
      RefereeParam refereeParam);
  Future<SimpleResult<LiveopResponse, ApiError>> enrollReferees(
      RefereeEnrollParam refereeEnrollParam);
}
