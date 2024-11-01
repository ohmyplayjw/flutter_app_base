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
import '../repositories/gym_repository.dart';

class GymUseCase {
  final GymRepository gymRepository;
  GymUseCase(this.gymRepository);
  Future<SimpleResult<CourtList, ApiError>> getCourts(
      DefaultParam defaultParam) async {
    return await gymRepository.getCourts(defaultParam);
  }

  Future<SimpleResult<ReservationList, ApiError>> getReservations(
      CourtParam courtParam) async {
    return await gymRepository.getReservations(courtParam);
  }

  Future<SimpleResult<RefereeList, ApiError>> getReferees(
      DefaultParam defaultParam) async {
    return await gymRepository.getReferees(defaultParam);
  }

  Future<SimpleResult<RefereeId, ApiError>> addReferee(
      RefereeParam refereeParam) async {
    return await gymRepository.addReferee(refereeParam);
  }

  Future<SimpleResult<LiveopResponse, ApiError>> enrollReferees(
      RefereeEnrollParam refereeEnrollParam) async {
    return await gymRepository.enrollReferees(refereeEnrollParam);
  }
}
